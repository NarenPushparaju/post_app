class UserCommentRating < ApplicationRecord
  belongs_to :user
  belongs_to :comment
  scope :check, -> (id,current_user) { where(comment_id: id,user_id: current_user).first_or_initialize }
end
