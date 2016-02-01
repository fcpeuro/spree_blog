module Spree
  module Admin
    class PostsController < ResourceController
      before_filter :load_data, :except => :index
      before_filter :convert_related_post_ids, :only => [:create, :update]

      def index
        respond_with(@collection)
      end

      protected
      def location_after_save
        edit_admin_post_path @post
      end

      def load_data
        @authors = Spree::Author.order(:last_name)
        @categories = Spree::Category.order(:name)
      end

      def find_resource
        Post.find_by_permalink!(params[:id])
      end

      def collection
        Post.order('published_at desc').page(params[:page] || 1).per(params[:per_page] || 30)
      end

      def convert_related_post_ids
        if params[:post][:related_post_ids]
          params[:post][:related_post_ids] = params[:post][:related_post_ids].split(',')
        end
        if params[:post][:category_ids]
          params[:post][:category_ids] = params[:post][:category_ids].split(',')
        end
      end

    end
  end
end
