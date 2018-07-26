class Post < ActiveRecord::Base
  belongs_to :topic
  has_many :comments, dependent: :delete_all
  has_many :parts
  has_many :tags, through: :parts
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :tags
end
