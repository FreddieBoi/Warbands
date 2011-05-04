class PagesController < ApplicationController
  def home
    # Get the last 3 news
    @news = News.order("created_at DESC").first(3)
  end

  def about
    @title = "About"
  end

  def contact
    @title = "Contact"
  end

  def help
    @title = "Help"
  end

end
