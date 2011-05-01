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

  def sortable(column, title = nil)
    title ||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    link_to title, {:sort => column, :direction => direction}, {:class => css_class}
  end

end
