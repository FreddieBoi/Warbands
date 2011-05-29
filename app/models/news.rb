# == Schema Information
# Schema version: 20110503223753
#
# Table name: news
#
#  id         :integer         not null, primary key
#  title      :string(255)     not null
#  content    :text            not null
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class News < ActiveRecord::Base
  belongs_to :user

  validates :user, :presence => true

  # Don't allow non-ascii signs in titles, might result in slug duplicates
  title_regex = /\A[a-z 0-9]*\z/i

  validates :title, :presence => true, :length => { :within => 2..30 },
                    :uniqueness => { :case_sensitive => false },
                    :format => { :with => title_regex }

  validates :content, :presence => true

  has_friendly_id :title, :use_slug => true, :strip_non_ascii => true
  # Search for News matching the title of the specified search term
  def self.search(search)
    if search
      where("LOWER (title) LIKE ?", "%#{search.downcase}%")
    else
      scoped # Empty scope, like calling 'all' but not performing the query
    end
  end
end
