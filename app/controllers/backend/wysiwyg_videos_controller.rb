class Backend::WysiwygVideosController < BackendController
  def index
    @videos = WysiwygVideo.order('created_at desc').limit(12)

    render 'index'
  end

  def create
    @video = WysiwygVideo.create(video: params.permit(:video)['video'])
    render 'show'
  end

  def show
    @attachment = WysiwygVideo.find(params[:id])

    render 'show'
  end
end