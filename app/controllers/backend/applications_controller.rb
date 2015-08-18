class Backend::ApplicationsController < BackendController
  before_action :find_application, only: [:show, :destroy]

  def index
    @applications = Application.order('created_at DESC')
  end

  def show
  end

  def destroy
    @application.destroy
    redirect_to backend_applications_path, notice: 'Application was successfully destroyed.'
  end

  protected
  def find_application
    @application = Application.find(params[:id])
  end
end