# frozen_string_literal: true

require 'devise/jwt/test_helpers'

module Request
  module AuthHelpers
    def auth_headers(user)
      headers = { 'Accept' => 'application/json', 'Content-Type' => 'application/json' }
      Devise::JWT::TestHelpers.auth_headers(headers, user)
    end

    def login_params(email, password)
      {
        user: {
          email:    email,
          password: password
        }
      }
    end
  end
end
