class ChangesNameInUsers < ActiveRecord::Migration[5.1]
  def change
    rename_column :posts, :name, :title
    rename_column :posts, :adress, :hastag
    rename_column :posts, :number, :description
  end
end
