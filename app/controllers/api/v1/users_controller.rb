# frozen_string_literal: true

module Api
  module V1
    class UsersController < V1Controller
      before_action :set_users, only: %i[index]

      def index
        json_response(UserSerializer.new(@users), :ok)
      end

      private

      def set_users
        @users = User.all
      end
    end
  end
end
