class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  validates :name,:hastag,:description,presence: true
end
