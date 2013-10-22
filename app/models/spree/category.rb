module Spree
  class Category < ActiveRecord::Base
#    self.table_name = 'blog_categories'

#    has_many :posts, class_name: "Blog::Post", inverse_of: :category

    validates :name, :permalink, presence: true
    validates :name, :permalink, uniqueness: true

    scope :sorted_alphabetically, -> { order('name') }

    make_permalink order: :name, field: :permalink

    attr_accessible :name, :description, :permalink

    def to_param
      self.permalink.presence || self.name.to_s.to_url
    end
  end
end
