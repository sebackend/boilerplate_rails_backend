module Api
  class ApiController < ApplicationController
    include ActionController::MimeResponds
    include Response
    include ExceptionHandler

    respond_to :json

    private

    def invalid_controller?
      # Excluido: Recuperación de contraseña: recover_passwords
      params[:controller].include?('recover_passwords') || devise_controller?
    end
  end
end
