# frozen_string_literal: true

class ApplicationController < ActionController::Base
  include Pagy::Backend

  protect_from_forgery with: :exception
  # before_action :authenticate_user!
  # before_action :configure_permitted_params!

  # protected

  # def configure_permitted_params
  #   devise_parameter_sanitizer.permit(:sign_up) do |user_params|
  #     user_params.permit(:email, :password, :password_confirmation, :admin)
  #   end
  # end
end
