module ApplicationHelper
  # Get the title of the app
  def app_title
    "Warbands Online"
  end

  # Get the title separator (used when combining app and page titles)
  def title_separator
    ">"
  end

  # Get the title of the page
  def page_title
    if @title.blank?
      app_title
    else
      "#{app_title} #{title_separator} #{@title}"
    end
  end

end
