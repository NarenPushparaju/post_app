class ChangeColumnToNewFromTableName < ActiveRecord::Migration[5.1]
  def change
  change_table :posts do |t|
    t.change :hastag, :text
    t.change :description, :text
    end
  end
end
