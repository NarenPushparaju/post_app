class Comment < ActiveRecord::Base
  belongs_to :post ,counter_cache: true
  belongs_to :user
  validates_presence_of :comment
  validates_length_of :comment ,minimum: 3
end