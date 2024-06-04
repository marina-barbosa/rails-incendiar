class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :cpf, :phone])
  end

  def check_admin
    unless current_user.admin?
      redirect_to(root_path, alert: "Você não tem permissão para acessar esta página.")
    end
  end
end
