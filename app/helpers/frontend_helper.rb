module FrontendHelper
  def background_image(image_filename)
    "background-image: url(#{ asset_path image_filename })"
  end

  def widget(name, type=:show, *args)
    render_cell name, type, *args
  end
end
