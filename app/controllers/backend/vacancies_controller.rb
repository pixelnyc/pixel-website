class Backend::VacanciesController < BackendController
  before_action :find_vacancy, only: [:show, :edit, :update, :destroy]
  def index
    @q = Vacancy.ransack(params[:q])
    @vacancies = @q.result(distinct: true).paginate(paginate_params)
  end

  def new
    @vacancy = Vacancy.new
  end

  def create
    @vacancy = Vacancy.new(vacancy_params)
    if @vacancy.save
      redirect_to backend_vacancies_path, notice: 'Vacancy was created'
    else
      render 'new', alert: 'Were errors'
    end
  end

  def show

  end

  def edit

  end

  def update
    if @vacancy.update(vacancy_params)
      redirect_to backend_vacancies_path, notice: 'Vacancy was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @vacancy.destroy
    redirect_to backend_vacancies_path, notice: 'Vacancy was successfully destroyed.'
  end

  protected
  def find_vacancy
    @vacancy = Vacancy.friendly.find(params[:id])
  end

  def vacancy_params
    params.require(:vacancy).permit(:position, :location, :content)
  end
end