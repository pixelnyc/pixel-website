class ProjectsRecentCell < Cell::Rails
  def show(options={})
    @excluded_project = options[:excluded]
    @projects = Project.latest.where.not(id: @excluded_project.try(:id)).limit(3)

    render 'show' if @projects.any?
  end
end
