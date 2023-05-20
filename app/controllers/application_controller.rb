# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  def check_if_logged_in
    unless current_doctor || current_user
      flash[:alert] = 'Вам потрібно авторизуватися для відвідування даної сторінки'
      redirect_to root_path
    end
  end

  def check_if_doctor
    unless current_doctor.present?
      flash[:alert] = 'Вам треба бути доктором для відвідування цієї сторінки'
      redirect_to root_path
    end
  end

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:phone])
    devise_parameter_sanitizer.permit(:account_update) do |u|
      u.permit(:name, :email, :password, :current_password, :avatar, :description, :category_id)
    end
  end
end
