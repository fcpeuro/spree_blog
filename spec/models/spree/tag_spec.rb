require 'spec_helper'

describe Spree::Tag do

  context "validations" do
    let(:tag) { build :tag }
    it "should be valid without a description" do
      expect(tag).to be_valid
    end
    it "should have an unique name" do
      another_tag = create :tag
      expect(tag).not_to be_valid
    end

    it "should have an unique name if not match case" do
      another_tag = create :tag, name: "mondiali calcio"
      expect(tag).not_to be_valid
    end
  end

  context "permalink" do
    let(:tag) { create :tag }
    it "should be generated directly by name" do
      expect(tag.permalink).to eq(tag.name.to_s.to_url)
    end
  end
end
