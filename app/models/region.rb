class Region < ActiveRecord::Base
  
  has_many :warbands
  
  def to_javascript_json
    to_json.gsub("\"", "'")
  end
  
end
