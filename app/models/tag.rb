class Tag < ApplicationRecord
  has_many :post_tags
  has_many :posts ,through: :post_tags
  validates_presence_of :tag
  validates_length_of :tag ,:minimum => 3
end