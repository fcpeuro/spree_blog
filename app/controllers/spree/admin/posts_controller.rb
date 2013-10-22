module Spree
  module Admin
    class PostsController < ResourceController
      before_filter :load_data, :except => :index

      def index
        respond_with(@collection)
      end

      protected
      def load_data
        @authors = Spree::Author.order(:last_name)
        @categories = Spree::Category.order(:name)
      end
      def find_resource
        Post.find_by_permalink!(params[:id])
      end
    end
  end
end

