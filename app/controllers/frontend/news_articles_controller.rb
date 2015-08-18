class Frontend::NewsArticlesController < FrontendController
  def index
    @news_articles = NewsArticle.published.latest.limit(9)
  end

  def show
    @news_article = NewsArticle.published.friendly.find(params[:id])
  end
end