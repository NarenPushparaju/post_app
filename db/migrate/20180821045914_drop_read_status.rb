class DropReadStatus < ActiveRecord::Migration[5.1]
  def change
    drop_table :read_statuses
  end
end
