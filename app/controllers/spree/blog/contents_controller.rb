module Spree
  module Blog
    class ContentsController < BaseController
      layout 'spree/layouts/spree_blog'

      def index
        @title = "Indice dei contenuti"
        @posts = Spree::Post.order(:published_at).reverse_order.limit(4)
        @categories = Spree::Category.order(:name)
        @tags = Spree::Tag.order(:name)
        @authors = Spree::Author.order([:last_name, :first_name])
      end

      def show
        if @post = Spree::Post.find_by_permalink(params[:slug])
          @title = @post.title
          render 'post'
        elsif @author = Spree::Author.find_by_permalink(params[:slug])
          @title = @author.full_name
          render 'author'
        elsif @category = Spree::Category.find_by_permalink(params[:slug])
          @title = @category.name
          render 'category'
        elsif @tag = Spree::Tag.find_by_permalink(params[:slug])
          @title = @tag.name
          render 'tag'
        else
          render_404
        end
      end

    end
  end
end
