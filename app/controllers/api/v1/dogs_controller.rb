module Api
  module V1
    class DogsController < ApplicationController
      before_action :set_dog, only: [:show, :update, :destroy]
      skip_before_action :verify_authenticity_token

      # GET /dogs
      def index
        @dogs = Dog.all
        render json: @dogs
      end

      # GET /dogs/:id
      def show
        if @dog
          render json: @dog 
        else 
          render json: { error: 'Dog not found' }, status: :not_found #
        end
      end

      # POST /dogs
      def create
        @dog = Dog.new(dog_params)
        if @dog.save
          render json: @dog, status: :created
        else
          render json: @dog.errors, status: :unprocessable_entity
        end
      end

      # PUT /dogs/:id
      def update
        if @dog.update(dog_params)
          render json: @dog
        else
          render json: @dog.errors, status: :unprocessable_entity
        end
      end

      # DELETE /dogs/:id
      def destroy
        @dog.destroy
        head :no_content
      end

      private

      def set_dog
        @dog = Dog.find(params[:id])
      end

      def dog_params
        params.require(:dog).permit(:name, :img)
      end
    end
  end
end
