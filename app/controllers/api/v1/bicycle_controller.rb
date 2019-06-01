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
        render json: find_bicycle.pluck(:id, :longitude, :latitude)
      end

      private

      def find_all
        Bicycle.all
      end

      def find_bicycle
        Bicycle.find_by(id: params[:id])
      end
    end
  end
end
