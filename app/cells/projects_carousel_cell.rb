class ProjectsCarouselCell < FrontendCell
  def show
    @projects = Project.latest.in_carousel.limit(5)

    if @projects.any?
      render 'show'
    else
      render nothing: true
    end
  end
end
