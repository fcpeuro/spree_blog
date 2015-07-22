module Spree
  class Tag < ActiveRecord::Base
    has_many :taggings, inverse_of: :tag, dependent: :destroy
    has_many :posts, -> { order(published_at: :desc) }, through: :taggings

    validates :name, :permalink, presence: true
    validates :name, :permalink, uniqueness: { case_sensitive: false }

    include HasPermalink
    friendly_id :name, use: :slugged, slug_column: :permalink

    def self.find_or_create!(tag_name)
      Tag.where(name: tag_name).first_or_create
    end

    scope :sorted_alphabetically, -> { order('name') }
    scope :trending, -> { where(trending: true) }
    scope :with_posts, -> { select('spree_tags.*').joins(:posts).group('spree_tags.id').merge(Post.visible) }
    scope :by_usage, -> { with_posts.select('COUNT(blog_tags.id) AS posts_count').order('posts_count DESC') }
    scope :non_trending, -> { where(trending: false) }

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
