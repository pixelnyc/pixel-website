class Backend::ProjectsController < BackendController
  before_action :find_item, only: [:show, :edit, :update, :destroy]


  def index
    @q = Project.latest.search(params[:q])
    @projects = @q.result(distinct: true).paginate(paginate_params)
  end

  def new
    @project = Project.new
  end

  def create
    @project = Project.new(project_params)
    if @project.save
      redirect_to backend_projects_path, notice: 'Project was successfully updated'
    else
      render 'new', alert: 'Check out the errors below'
    end
  end

  def edit
  end

  def update
    if @project.update(project_params)
      redirect_to edit_backend_project_path(@project), notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @project.destroy
    redirect_to backend_projects_path, notice: 'Project was successfully destroyed'
  end

  protected
  def find_item
    @project = Project.friendly.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description, :content, :tile_cover, :carousel_cover, :in_carousel,
                                    :cover, :video, :virtual_services, :carousel_title, :carousel_description, :link,
                                    :carousel_text_color)
  end
end