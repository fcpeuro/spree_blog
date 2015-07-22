require 'active_support/concern'

module Spree
  module HasPermalink
    extend ActiveSupport::Concern

    included do
      extend FriendlyId
      before_validation :normalize_permalink, on: [:create, :update]
    end

    def normalize_permalink
      self.permalink = normalize_friendly_id(permalink)
    end

  end
end