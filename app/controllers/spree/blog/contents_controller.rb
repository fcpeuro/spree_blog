module Spree
  module Blog
    class ContentsController < BaseController
      layout 'spree/layouts/spree_blog'

      def index
        @title = "Indice dei contenuti"
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
