class DropCategoryId < ActiveRecord::Migration
  def change
    remove_column :spree_posts, :category_id
  end
end
