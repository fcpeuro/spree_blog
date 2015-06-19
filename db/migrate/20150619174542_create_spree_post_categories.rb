class CreateSpreePostCategories < ActiveRecord::Migration

  def change
    create_table :spree_post_categories do |t|
      t.integer  :post_id,    null: false, index: true
      t.integer  :category_id, null: false, index: true
    end
  end

end
