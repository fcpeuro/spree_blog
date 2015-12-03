module Spree
  class BlogComment < ActiveRecord::Base
    belongs_to :post
    belongs_to :user
    has_many :answers, class_name: Spree::BlogComment, foreign_key: 'parent_id'

    validates :body, presence: true
  end
end