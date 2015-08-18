module Backend; end;

class BackendController < ActionController::Base
  helper BackendHelper

  WillPaginate.per_page = 20

  layout 'backend'

  before_action :authenticate_admin_user!

  def paginate_params
    { page: params[:page], per_page: 20 }
  end
end