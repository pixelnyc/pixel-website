class Backend::NewsArticlesController < BackendController
  before_action :find_news_article, only: [:show, :edit, :update, :destroy]

  def index
    @q = NewsArticle.latest.search(params[:q])
    @news_articles = @q.result(distinct: true).paginate(paginate_params)
  end

  def new
    @news_article = NewsArticle.new
  end

  def create
    @news_article = NewsArticle.new(news_article_params)
    if @news_article.save
      redirect_to backend_news_articles_path, notice: 'Article was successfully updated'
    else
      render 'new', alert: 'Check out the errors below'
    end
  end

  def edit
  end

  def update
    if @news_article.update(news_article_params)
      redirect_to backend_news_articles_path, notice: 'Article was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @news_article.destroy
    redirect_to backend_news_articles_path, notice: 'Article was successfully destroyed'
  end

  protected
  def find_news_article
    @news_article = NewsArticle.friendly.find(params[:id])
  end

  def news_article_params
    params.require(:news_article).permit(:title, :readout, :content, :cover, :author, :published)
  end
end