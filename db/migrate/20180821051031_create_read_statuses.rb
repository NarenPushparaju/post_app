class CreateReadStatuses < ActiveRecord::Migration[5.1]
  def change
    create_table :read_statuses do |t|
      t.references :post, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
