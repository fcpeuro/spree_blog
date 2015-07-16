module Spree
  class Category < ActiveRecord::Base
    acts_as_nested_set
    has_many :post_categories, inverse_of: :category
    has_many :posts, ->{ order(published_at: :desc) }, through: :post_categories, source: :post

    validates :name, :permalink, presence: true
    validates :name, :permalink, uniqueness: { case_sensitive: false }

    scope :sorted_alphabetically, -> { order(:name) }

    make_permalink order: :name, field: :permalink

    def to_param
      self.permalink.presence || self.name.to_s.to_url
    end

    def seo_slug
      self.permalink
    end

    def seo_title
      self.name
    end

    def seo_description
      self.description
    end
  end
end
