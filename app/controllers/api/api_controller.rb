module Api
  class ApiController < ApplicationController
    include Response
    include ExceptionHandler

    load_and_authorize_resource unless: :invalid_controller?
    respond_to :json

    private

    def invalid_controller?
      # Excluido: Recuperación de contraseña: recover_passwords
      params[:controller].include?('recover_passwords') || devise_controller?
    end
  end
end
