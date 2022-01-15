# frozen_string_literal: true

module Api
  module V1
    class SessionsController < ::Devise::SessionsController
      include Response
      include ExceptionHandler

      def create
        self.resource = warden.authenticate!(auth_options)
        set_flash_message!(:notice, :signed_in)
        sign_in(resource_name, resource)
        yield resource if block_given?
        respond_with resource, location: after_sign_in_path_for(resource)
      end

      def my_user
        render json: {
          logged_in: current_user.present?,
          user_info: current_user.present? ? UserSerializer.new(current_user) : nil
        }
      end

      private

      def respond_with(resource, _opts={})
        render json: resource
      end

      def respond_to_on_destroy
        head :no_content
      end
    end
  end
end
