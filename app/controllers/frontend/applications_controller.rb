class Frontend::ApplicationsController < FrontendController
  def create
    #@vacancy = Vacancy.friendly.find(params[:vacancy_id])

    @application = Application.new(application_params)
    #@application.location = @vacancy.location
    if @application.save
      render 'success', layout: false
    else
      render partial: 'frontend/vacancies/form', layout: false
    end
  end

  protected

  def application_params
    params.require(:application).permit(:first_name, :last_name, :phone, :email, :resume, :cover_letter,
                                        :portfolio_url, :linkedin_url, :website)
  end
end