module Spree
  class Author < ActiveRecord::Base
    has_many :posts, -> { order(published_at: :desc) },  inverse_of: :author

    validates :first_name, :last_name, :permalink, :seo_description, presence: true
    validates :permalink, :uniqueness => true
    scope :sorted_alphabetically, -> { order('first_name, last_name') }

    include HasPermalink
    friendly_id :full_name, use: :slugged, slug_column: :permalink

    def full_name
      [ first_name, last_name ].join(" ")
    end

    def seo_slug
      self.permalink
    end

    def seo_title
      self.full_name.to_s
    end

    def should_generate_new_friendly_id?
      permalink.blank?
    end
  end
end
