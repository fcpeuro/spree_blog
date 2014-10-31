module Spree
  Variant.class_eval do
    has_many :posts
  end
end
