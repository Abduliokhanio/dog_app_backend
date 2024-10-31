module Api
  module V1
    class UsersController < ApplicationController
      # respond_to :json

      def index
        users = User.all
        render json: users
      end

      def new
      end

      def show
      end

      def create
      end

      def edit
      end

      def update
      end

      def destroy
      end
    end
  end
end