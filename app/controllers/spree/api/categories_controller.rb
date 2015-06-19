module Spree
  module Api
    class CategoriesController < Spree::Api::BaseController
      respond_to :json
      def index
        if params[:ids]
          @categories = Category.find params[:ids].split(',')
        else
          @categories = Category.ransack(params[:q]).result.page(params[:page]).per(params[:per_page])
        end
      end

      def show
        @category = Category.find(params[:id])
      end
    end
  end
end
