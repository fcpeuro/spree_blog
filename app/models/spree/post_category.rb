module Spree
  class PostCategory < ActiveRecord::Base

    belongs_to :post
    belongs_to :category

    validates :post, :category, presence: true
    validates :category_id, uniqueness: { scope: :post_id }
  end
end