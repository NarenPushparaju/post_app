class Topic < ActiveRecord::Base
  has_many :posts
  accepts_nested_attributes_for :posts
  validates_presence_of :topic
  validates :topic, length: { minimum: 3 }
end