class SocialShareCell < FrontendCell
  def show(options={})
    @url = options[:url]
    @title = options[:title]
    @image_url = options[:image_url]
    render
  end
end
