module Spree
  module Blog
    class ContentsController < BaseController
      include Spree::Core::ControllerHelpers::Order
      layout 'spree/layouts/spree_blog'

      before_filter :load_blog_data

      def index
        @order = current_order
        @title = "Indice dei contenuti"
        @posts = Spree::Post.order(:published_at).reverse_order.visible.limit(4)
      end

      def show
        if @post = Spree::Post.where(permalink: params[:slug]).visible.first
          @title = @post.title
          render 'post'
        elsif @author = Spree::Author.where(permalink: params[:slug]).first
          @title = @author.full_name
          render 'author'
        elsif @category = Spree::Category.where(permalink: params[:slug]).first
          @title = @category.name
          render 'category'
        elsif @tag = Spree::Tag.where(permalink: params[:slug]).first
          @title = @tag.name
          render 'tag'
        else
          render_404
        end
      end

      protected
      def load_blog_data
        @categories = Spree::Category.order(:name)
        @tags = Spree::Tag.with_posts.sorted_alphabetically
        @authors = Spree::Author.order([:last_name, :first_name])
      end
    end
  end
end
