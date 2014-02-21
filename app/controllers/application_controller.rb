class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << [:first_name, :last_name, :course_code]
  end

  rescue_from Exception do |e|
    Bugsnag.notify e
    raise e
  end

  def admin_only
    redirect_to root_path, alert: 'Access Denied' unless user_signed_in? && current_user.admin?
  end

  def self_only
    redirect_to root_path, alert: 'Access Denied' if !current_user.admin? && params[:id].to_i != current_user.id
  end

end
