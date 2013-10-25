module Spree
  class Post < ActiveRecord::Base
    belongs_to :category, inverse_of: :posts
    belongs_to :author,   inverse_of: :posts

    has_many :taggings, inverse_of: :post
    has_many :tags, through: :taggings
    has_many :post_relations, inverse_of: :post
    has_many :related_posts, through: :post_relations, source: :related

    validates :title, :body, :category, :author, :published_at, presence: true
#    validate :check_presence_of_featured_image_if_sticky

    scope :sorted_by_date, -> { order('published_at DESC') }
    scope :sticky, -> { where(sticky: true) }
    scope :matching_query, ->(query) { where("title LIKE :query OR body LIKE :query", query: "%#{query}%") }
    scope :visible, -> { where(visible: true) }
    scope :published, -> { visible.where('published_at < ?', Time.now) }

#    has_image :featured_image

    attr_accessible :category_id, :author_id, :title, :abstract, :body, :sticky,
                    :visible, :published_at, :permalink, :seo_title, :seo_description,
                    :comma_separated_tags, :related_post_ids, :tag_names

    make_permalink order: :published_at, field: :permalink

    def permalink_or_title
      self.permalink.presence || title
    end

    def comma_separated_tags
      tags.map(&:name).join(',')
    end

    def comma_separated_tags=(data)
      self.tags = []
      data.split(/\s*,\s*/).each do |tag_name|
        self.tags << Tag.find_or_create!(tag_name)
      end
    end

    def author_name
      author.full_name
    end

    def tag_names
      tags.map(&:name).join(",")
    end

    def tag_names=(names)
      ids = names.split(",").map { |name|
        Spree::Tag.where(permalink: name.to_s.to_url).first_or_create(name: name).id
      }.uniq.compact
      self.tag_ids = ids
    end

    def to_param
      self.permalink.presence || self.title.to_s.to_url
    end

    private

#    def check_presence_of_featured_image_if_sticky
#      if self.sticky && self.featured_image.nil?
#        errors.add(:sticky, "richiede la presenza di una featured image")
#      end
#    end
  end
end
