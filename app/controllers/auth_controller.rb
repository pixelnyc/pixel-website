class AuthController < ActionController::Base
  layout 'devise'

  def after_sing_in_path_for(resource)
    backend_path
  end
end