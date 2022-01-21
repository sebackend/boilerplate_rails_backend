# frozen_string_literal: true

module Api
  module V1
    class RegistrationsController < ::Devise::RegistrationsController
      include Response
      include ExceptionHandler
      before_action :configure_sign_up_params, only: [:create]
      respond_to :json

      def create
        super { |resource| @resource = resource }
      end

      protected

      def configure_sign_up_params
        devise_parameter_sanitizer.permit(:sign_up, keys: %i[email first_name last_name password])
      end
    end
  end
end
