class Frontend::ProjectsController < FrontendController
  def index
    @projects = Project.latest.limit(9).to_a
  end

  def show
    @project = Project.friendly.find(params[:id])
  end
end