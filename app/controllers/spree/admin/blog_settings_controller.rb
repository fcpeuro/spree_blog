module Spree
  module Admin
    class BlogSettingsController < BaseController
      def edit
        @preferences = [:posts_per_page, :layout]
      end

      def update
        params.each do |name, value|
          next unless SpreeBlog::Config.has_preference? name
          SpreeBlog::Config[name] = value
        end

        flash[:success] = Spree.t(:successfully_updated, resource: Spree.t(:blog_settings))
        redirect_to edit_admin_blog_settings_path
      end
    end
  end
end