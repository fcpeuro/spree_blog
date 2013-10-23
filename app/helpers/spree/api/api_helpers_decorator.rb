module Spree
  module Api
    ApiHelpers.module_eval do
      def tag_attributes
        [:id, :name, :permalink, :description, :trending]
      end
    end
  end
end
