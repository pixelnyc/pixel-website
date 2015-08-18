class GalleriesController < BackendController

  def edit

  end

  def update

  end

  def find_gallery
    @gallery = Gallery.find(params[:id])
  end

end