class CreateUserCommentRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :user_comment_ratings do |t|
      t.integer :rate
      t.integer :user_id
      t.integer :comment_id
      t.timestamps
    end
  end
end