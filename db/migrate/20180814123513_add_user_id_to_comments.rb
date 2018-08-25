class AddUserIdToComments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :user_id, :integer
    add_column :comments, :name, :string
  end
end
