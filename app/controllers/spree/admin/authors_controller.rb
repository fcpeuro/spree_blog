module Spree
  module Admin
    class AuthorsController < ResourceController
      def index
        respond_with(@collection)
      end
    end
  end
end

