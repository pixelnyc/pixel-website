class Backend::GalleryPhotosController < BackendController
  before_action :find_gallery
  respond_to :json
  def index
    @photos = @gallery.gallery_photos.order('created_at asc')
  end

  def create
    @photo = GalleryPhoto.new(photo: params[:file], gallery: @gallery)
    if @photo.save
      render 'show'
    else
      render nothing: true
    end
  end

  def destroy
    @photo = @gallery.gallery_photos.find(params[:id])
    @photo.destroy

    render nothing: true
  end

  def find_gallery
    @gallery = Gallery.find(params[:gallery_id])
  end
end