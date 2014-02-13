class AddVariantToPosts < ActiveRecord::Migration
  def change
    add_column :spree_posts, :variant_id, :integer
  end
end
