class AddUserIdAndPostId < ActiveRecord::Migration[5.1]
  def change
    add_reference :read_statuses, :users, foreign_key: true
    add_reference :read_statuses, :posts, foreign_key: true
  end
end