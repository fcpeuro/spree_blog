class CreateSpreeAuthors < ActiveRecord::Migration

  def change
    create_table :spree_authors do |t|
      t.string   :first_name
      t.string   :last_name
      t.text     :bio
      t.text     :permalink,  null: false
      t.text     :seo_description

      t.timestamps
    end
    add_index :spree_authors, [:permalink], name: :index_spree_authors_on_permalink
  end

end
