# == Schema Information
# Schema version: 20110430234753
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(128)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  name                   :string(255)     not null
#  created_at             :datetime
#  updated_at             :datetime
#  admin                  :boolean
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :name, :email, :password, :password_confirmation, :remember_me

  validates :name, :presence => true, :length => { :within => 2..20 },
                    :uniqueness => { :case_sensitive => false }

  # FIXME! Slugs not unique for names containing non-ASCII signs
  # (eg. freddieboi2008, freddieboi%&, freddieboi=) etc.)
  # Fix with something like:
  # name_regex = /somecoolregex/
  # validates :name, :format => { :with => name_regex }
  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true

  has_one :warband, :dependent => :destroy
  # Search for Users matching the name of the specified search term
  def self.search(search)
    if search
      where('name LIKE ?', "%#{search.downcase}%")
    else
      scoped # Empty scope, like calling 'all' but not performing the query
    end
  end
end
