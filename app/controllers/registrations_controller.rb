class RegistrationsController < Devise::RegistrationsController
  def create
    super
    UserMailer.welcome(resource).deliver
  end

  protected

  def after_sign_up_path_for(resource)
    edit_user_path(resource)
  end

  def after_inactive_sign_up_path_for(resource)
    edit_user_path(resource)
  end
end
