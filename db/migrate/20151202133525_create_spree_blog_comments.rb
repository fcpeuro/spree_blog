class CreateSpreeBlogComments < ActiveRecord::Migration

  def change
    create_table :spree_blog_comments do |t|
      t.integer  :post_id, null: false
      t.integer  :user_id, null: false
      t.integer  :parent_id
      t.string   :name
      t.text     :body

      t.timestamps
    end
    add_index :spree_blog_comments, [:post_id]
    add_index :spree_blog_comments, [:user_id]
  end

end
