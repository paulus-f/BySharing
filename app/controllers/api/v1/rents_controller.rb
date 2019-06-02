module Api
  module V1
    class RentsController < ApplicationController

      before_action :current_rent, only: %i[show unbook unrent finish_rent]

      def show
        render json: { rent: @rent }, status: 200
      end

      def create
        params_rent = params.permit(:current_price, :start_date,
                                    :end_date, :bicycle_id, :tenant_id)
        if Rent.create!(params_rent)
          render json: params_rent, status: 200
        else
          render json: 'reject', status: 400
        end
      end

      def finish_rent
        if params[is_owner]
          @rent.update_attribute(:finished_owner, true)
          return render json: 'Complete', status: 200
        end

        if params[is_tenant]
          @rent.update_attribute(:finished_tenant, true)
          return render json: 'Complete', status: 200
        end

        render status: 204
      end

      def unbook
        return render json: 'OK' if @rent.destroy

        render json: 'Error'
      end

      def unrent
        if @rent.finished_owner && @rent.finished_tenant
          @rent.destroy
          return render json: 'OK'
        end

        render json: 'Error'
      end

      private

      def current_rent
        @rent = Rent.find_by(id: params[:id])
      end
    end
  end
end
