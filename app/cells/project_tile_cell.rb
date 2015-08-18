class ProjectTileCell < Cell::Rails
  def show(options)
    @project = options[:project]

    render 'show' if @project
  end
end
