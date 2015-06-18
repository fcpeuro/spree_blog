class AddParentIdToCategories < ActiveRecord::Migration
  def change
    change_table :spree_categories do |t|
      t.integer :parent_id, :index => true
      t.integer :lft, :null => false, :index => true
      t.integer :rgt, :null => false, :index => true
    end

    Spree::Category.rebuild!
  end
end