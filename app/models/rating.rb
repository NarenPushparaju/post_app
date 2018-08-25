class Rating < ApplicationRecord
  belongs_to :post
  belongs_to :user
  validates_presence_of :rate
  validates_inclusion_of :rate,in: 1..5
end