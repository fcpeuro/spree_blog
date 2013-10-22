module Spree
  module Admin
    class PostsController < ResourceController
      def index
        respond_with(@collection)
      end
    end
  end
end

