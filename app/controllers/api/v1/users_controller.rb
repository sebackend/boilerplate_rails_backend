# frozen_string_literal: true

module Api
  module V1
    class UsersController < V1Controller
      before_action :set_users, only: %i[index]
      before_action :set_user, only: %i[show]

      def index
        json_response(UserSerializer.new(@users), :ok)
      end

      def show
        json_response(UserSerializer.new(@user), :ok)
      end

      private

      def set_users
        @users = User.all
      end

      def set_user
        @user = User.find(params[:id])
      end
    end
  end
end
