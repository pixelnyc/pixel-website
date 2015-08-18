class Frontend::SiteController < FrontendController

  def index
    @latest_projects = Project.latest.limit(8).to_a
    @latest_news_articles = NewsArticle.published.latest.limit(2).to_a
    render 'index', layout: 'frontend_homepage'
  end

  def about
  end

  def contact
  end
end