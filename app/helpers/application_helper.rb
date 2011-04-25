module ApplicationHelper
  # Get the title of the app
  def app_title
    "Warbands Online"
  end

  # Get the title of the page
  def page_title
    if @title.nil?
      app_title
    else
      "#{app_title} > #{@title}"
    end
  end
end
