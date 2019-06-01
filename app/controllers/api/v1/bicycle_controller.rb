module Api
  module V1
    class BicycleController < ApplicationController
      def show
        render json: find_bicycle
      end

      def index
        render json: find_all
      end

      def map
        render json: find_all.pluck(:id, :longitude, :latitude)
      end

      def create
        manufacturer = Manufacturer.find_by(name: params[:manufacturer])
        unless manufacturer
          manufacturer = Manufacturer.new(name: params[:manufacturer])
          manufacturer.save
        end
        @bicycle = Bicycle.new(bicycle_params)
        @bicycle.manufacturer = manufacturer

        if @bicycle.save
          render json: { message: 'success'}, status: 200
        else
          render json: { message: 'error'}, status: 402
        end
      end

      def destroy
        @bicycle = find_bicycle
        if @bicycle&.destroy
          render json: { message: 'success'}, status: 200
        else
          render json: { message: 'error'}, status: 404
        end
      end

      private

      def find_all
        Bicycle.all
      end

      def bicycle_params
        params.permit(:name, :price, :bike_type, :longitude, :latitude)
      end

      def find_bicycle
        Bicycle.find_by(id: params[:id])
      end
    end
  end
end
