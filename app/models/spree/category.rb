module Spree
  class Category < ActiveRecord::Base
    acts_as_nested_set
    has_many :post_categories, inverse_of: :category
    has_many :posts, ->{ order(published_at: :desc) }, through: :post_categories, source: :post

    validates :name, :permalink, presence: true
    validates :name, :permalink, uniqueness: { case_sensitive: false }

    scope :sorted_alphabetically, -> { order(:name) }

    include HasPermalink
    friendly_id :name, use: :slugged, slug_column: :permalink

    def seo_slug
      self.permalink
    end

    def seo_title
      self.name
    end

    def seo_description
      self.description
    end

    def should_generate_new_friendly_id?
      permalink.blank?
    end
  end
end
