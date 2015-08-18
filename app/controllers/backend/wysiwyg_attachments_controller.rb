class Backend::WysiwygAttachmentsController < BackendController
  def index
    @attachments = WysiwygAttachment.order('created_at desc').limit(12)

    render 'index'
  end

  def create
    @attachment = WysiwygAttachment.create(image: params.permit(:attachment)['attachment'])
    render 'show'
  end

  def show
    @attachment = WysiwygAttachment.find(params[:id])

    render 'show'
  end
end