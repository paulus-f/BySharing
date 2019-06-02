module Api
  module V1
    class BicycleController < ApplicationController
      def show
        render json: { bicycle: find_bicycle, rents: find_bicycle.rents }, status: 200
      end

      def index
        render json: find_all
      end

      def map
        if params[:title]
          return render json: find_all.where('title ILIKE ?', params[:title])
                                      .select(:id, :longitude, :latitude, :name)
        end

        render json: find_all.select(:id, :longitude, :latitude, :name)
      end

      def create
        manufacturer = Manufacturer.find_by(name: params[:manufacturer])
        unless manufacturer
          manufacturer = Manufacturer.new(name: params[:manufacturer])
          manufaScturer.save
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
        params.permit(:name, :price, :bike_type, :longitude, :latitude, :user_id)
      end

      def find_bicycle
        Bicycle.find_by(id: params[:id])
      end
    end
  end
end
