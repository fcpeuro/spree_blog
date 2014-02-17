class AddProductLabelToPosts < ActiveRecord::Migration
  def self.up
    add_column :spree_posts, :product_label, :string
  end

  def self.down
    drop_column :spree_posts, :product_label
  end
end
