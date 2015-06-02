class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?
  before_filter :set_locale
  before_filter :banned?
  layout :detect_layout

  # Reģistrāijas parametri
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:email, :username, :password) }
  end

  private

  # Nosaka layout DEvise kontrolieriem
  def detect_layout
    if devise_controller?
      "home"
    else
      "application"
    end
  end

  # Uzstāda valodu
  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  # Uzstāda defaulto valodu
  def default_url_options(options = {})
    {locale: I18n.locale}
  end

  protected

  # Lietotājs ir nobloķēts un mēģina pieslēgties
  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.is_banned?
      sign_out resource
      flash[:alert] = t('.alert')
      home_index_path
    else
      super
    end
  end

  # Tiek izmests lietotājs, kas ir bijis pieslēdzies bloķēšanas brīdī
  def banned?
    if current_user.present? && current_user.is_banned?
      sign_out current_user
      flash[:alert] = t('.alert')
      home_index_path
    end
  end

end
