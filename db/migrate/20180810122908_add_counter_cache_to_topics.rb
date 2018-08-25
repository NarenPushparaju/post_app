class AddCounterCacheToTopics < ActiveRecord::Migration[5.1]
  def change
    add_column :topics, :posts_count, :integer, default: 0
    Topic.find_each {|topic| Topic.reset_counters(topic.id,:posts)}
  end
end