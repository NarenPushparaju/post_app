class DropPostsTags < ActiveRecord::Migration[5.1]
  def change
    drop_table :posts_tags
  end
end