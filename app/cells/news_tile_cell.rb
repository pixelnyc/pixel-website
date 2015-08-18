class NewsTileCell < Cell::Rails
  def show(options)
    @news_article = options[:article]

    render 'show' if @news_article
  end
end
