class AddProductToPosts < ActiveRecord::Migration
  def change
    add_column :spree_posts, :product_id, :integer
  end
end
