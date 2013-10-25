module Spree
  module Api
    class PostsController < Spree::Api::BaseController
      respond_to :json
      def index
        @posts = Post.ransack(params[:q]).result.page(params[:page]).per(params[:per_page])
      end

      def show
        @post = Post.find(params[:id])
      end
    end
  end
end
