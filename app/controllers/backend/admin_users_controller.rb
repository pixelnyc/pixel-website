
module Backend
  class AdminUsersController < BackendController
    before_action :set_user, only: [:show, :edit, :update, :destroy]

    def index
      @users = AdminUser.paginate(paginate_params)
    end

    def show
    end

    def new
      @user = AdminUser.new
    end

    def edit
    end

    def create
      @user = AdminUser.new(user_params)

      if @user.save
        redirect_to backend_admin_users_path, notice: 'Пользователь был успешно добавлен в систему'
      else
        flash[:error] = 'Произошла ошибка при добавлении пользователя'
        render :new
      end
    end

    def update
      if @user.update(user_params)
        redirect_to backend_admin_users_path, notice: 'Пользователь был успешно обновлен'
      else
        flash[:error] = 'Произошла ошибка при обновлении пользователя'
        render :edit
      end
    end

    def destroy
      if AdminUser.count <= 1
        flash[:error] = 'Вы не можете удалить последнего администратора'
        redirect_to backend_admin_users_url
      else
        @user.destroy
        redirect_to backend_admin_users_url, notice: 'Пользователь был успешно удален'
      end
    end

    private
    def set_user
      @user = AdminUser.find(params[:id])
    end

    def user_params
      params.require(:admin_user).permit(:email, :password)
    end
  end
end