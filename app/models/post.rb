class Post < ActiveRecord::Base
  belongs_to :topic
  has_many :comments
  accepts_nested_attributes_for :comments
end
