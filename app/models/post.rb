class Post < ActiveRecord::Base
  belongs_to :topic
  has_many :comments, dependent: :delete_all
  has_many :parts
  has_many :tags, through: :parts
  has_many :ratings
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :tags
  accepts_nested_attributes_for :ratings
  scope :most_recent, -> {order(id: :desc)}
end
