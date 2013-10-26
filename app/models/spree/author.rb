module Spree
  class Author < ActiveRecord::Base
    has_many :posts, inverse_of: :author

    validates :first_name, :last_name, :bio, :permalink, presence: true
    validates :permalink, :uniqueness => true
    scope :sorted_alphabetically, -> { order('first_name, last_name') }
    attr_accessible :first_name, :last_name, :permalink, :bio

    make_permalink order: :first_name, field: :permalink

    def full_name
      [ first_name, last_name ].join(" ")
    end

    def to_param
      self.permalink.presence || self.full_name.to_s.to_url
    end

  end
end
