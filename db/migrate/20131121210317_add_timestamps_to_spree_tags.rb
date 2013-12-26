class AddTimestampsToSpreeTags < ActiveRecord::Migration
  def change
    add_column :spree_tags, :updated_at, :timestamp
    add_column :spree_tags, :created_at, :timestamp
  end
end
