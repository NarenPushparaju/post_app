class CreatePosts < ActiveRecord::Migration[5.1]
  def change
    create_table :posts do |t|
	t.string :name
	t.text :adress
	t.numeric :number
	t.timestamps
    end
  end
end
