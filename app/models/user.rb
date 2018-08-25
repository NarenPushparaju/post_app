class User < ApplicationRecord
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :read_statuses, dependent: :destroy
  has_many :posts, through: :read_statuses
  has_many :ratings

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  validate :password_complexity

  def password_complexity

    return if password.blank? || password =~ /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9]).{5,70}$/

    errors.add :password, 'Password must include: 1 uppercase, 1 lowercase, 1 digit '
    end
end