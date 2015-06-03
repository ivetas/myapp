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

  # Norāda devise kontrolieru layoutu
  def detect_layout
    if devise_controller?
      "home"
    else
      "application"
    end
  end

  # Valodas uzstādīšana
  def set_locale
    I18n.locale = params[:locale] if params[:locale].present?
  end

  # defaultā valoda
  def default_url_options(options = {})
    {locale: I18n.locale}
  end

  protected

  # bloķēts lietotājs nevar pieslēgties
  def after_sign_in_path_for(resource)
    if resource.is_a?(User) && resource.is_banned?
      sign_out resource
      flash[:alert] = t('.alert')
      home_index_path
    else
      super
    end
  end

  # bloķēts lietotājs tiek atslēgts no sistēmas, ja tas vēljoprojām ir pieslēdzies
  def banned?
    if current_user.present? && current_user.is_banned?
      sign_out current_user
      flash[:alert] = t('.alert')
      home_index_path
    end
  end

end
