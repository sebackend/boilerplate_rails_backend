# frozen_string_literal: true

module Api
  module V1
    class RegistrationsController < ::Devise::RegistrationsController
      include Response
      include ExceptionHandler

      def create
        build_resource(sign_up_params)

        resource.save!
        render_resource(resource)
      end
    end
  end
end
