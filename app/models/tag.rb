class Tag < ApplicationRecord
  has_many :parts
  has_many :posts ,through: :parts
end
