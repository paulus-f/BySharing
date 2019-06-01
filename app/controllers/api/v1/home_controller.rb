module Api
  module V1
    class HomeController < ApplicationController
      def index
        render json: { test: 'test'}, status: 200
      end
    end
  end
end
