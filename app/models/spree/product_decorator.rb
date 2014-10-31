module Spree
  Product.class_eval do
    #    delegate :posts, to: :master
    has_many :posts, through: :variants_including_master
  end
end
