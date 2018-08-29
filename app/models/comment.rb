class Comment < ActiveRecord::Base
  belongs_to :post ,counter_cache: true
  belongs_to :user
  has_many :user_comment_ratings,dependent: :destroy
  has_many :users,through: :user_comment_ratings
  validates_presence_of :comment
  validates_length_of :comment ,minimum: 3
  accepts_nested_attributes_for :user_comment_ratings
end