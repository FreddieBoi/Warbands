# == Schema Information
# Schema version: 20110526224251
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
#  rpx_identifier         :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :recoverable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable, :rpx_connectable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :name, :password, :password_confirmation, :remember_me

  # Don't allow non-ascii signs, will result in multiple users with same slug
  name_regex = /\A[a-z0-9]{2,20}\z/i

  # Ensure there is a valid name
  validates :name,  :presence => true,
                    :length => { :within => 2..20 },
                    :uniqueness => { :case_sensitive => false },
                    :format => { :with => name_regex }

  # Make it possible to query users by name
  has_friendly_id :name, :use_slug => true, :strip_non_ascii => true

  has_one :world, :dependent => :destroy

  has_one :warband, :through => :world

  # Create a world for the user upon user creation
  after_create :create_world

  # A bit of an ugly fix, to not require users to have passwords.
  before_validation :default_password
  # Search for users with names matching the specified search term
  def self.search(search)
    if search
      where("LOWER (name) LIKE ?", "%#{search.downcase}%")
    else
      scoped # Empty scope, like calling 'all' but not performing the query
    end
  end

  # def before_rpx_success(rpx_user)

  # end

  def before_rpx_auto_create(rpx_user)
    # Get email (if the provider supports it). This is already done?
    # self.email = rpx_user["email"]
    # This might cause conflicts, should we use the email as name instead?
    self.name = rpx_user["username"]
  end

  def update_with_password(params={})
    if params[:password].blank?
      params.delete(:password)
      params.delete(:password_confirmation) if params[:password_confirmation].blank?
    end
    update_attributes(params)
  end

  private

  # Create a world for the user
  def create_world
    my_world = World.create!(:world_template => WorldTemplate.first, :user => self)
  end

  def default_password
    self.password = "password_dummy"
    self.password_confirmation = "password_dummy"
  end

end
