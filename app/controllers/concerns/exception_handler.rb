module ExceptionHandler
  # Observación: mientras más abajo la definición, mayor es la prioridad (anti-intuitivo).

  extend ActiveSupport::Concern

  included do
    rescue_from StandardError do |e|
      status = :internal_server_error
      status = :unauthorized if e.class == CanCan::AccessDenied
      puts e.backtrace unless e.class == CanCan::AccessDenied
      json_response({ message: e.message, backtrace: e.backtrace[0..10] }, status)
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({ message: e.message }, :unprocessable_entity)
    end

    rescue_from ActiveRecord::RecordNotFound do
      json_response({ message: I18n.t('activerecord.errors.messages.not_found') }, :not_found)
    end
  end
end
