class RemoveTopicReferences < ActiveRecord::Migration[5.1]
  def change
    change_table :users do |t|
      t.remove_references :topic
    end
  end
end