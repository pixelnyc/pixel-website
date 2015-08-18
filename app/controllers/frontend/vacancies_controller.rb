class Frontend::VacanciesController < FrontendController
  def index
    #@vacancies = Vacancy.order('created_at desc')
    @application = Application.new
  end

  def show
    #@vacancy = Vacancy.friendly.find(params[:id])
  end
end