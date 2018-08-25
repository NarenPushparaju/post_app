class RemoveColumn < ActiveRecord::Migration[5.1]
  def change
    remove_column :topics ,:user_id
  end
end
