class Post < ActiveRecord::Base
  belongs_to :topic, counter_cache: true
  has_many :comments, dependent: :destroy
  has_many :post_tags
  belongs_to :user
  has_many :tags, through: :post_tags
  has_many :ratings, dependent: :destroy
  has_many :read_statuses, dependent: :destroy
  has_many :users, through: :read_statuses

  has_attached_file :image, styles: { large: "600x600>", medium: "300x300>", thumb: "150x150#" }, default_url: "/images/:style/missing.png"
  accepts_nested_attributes_for :comments
  accepts_nested_attributes_for :tags,reject_if: proc { |attributes| attributes['tag'].blank? }
  accepts_nested_attributes_for :ratings
  scope :most_recent, -> {order(id: :desc)}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates_presence_of :description,:title,:topic_id
  validates_length_of :title ,:minimum => 3
  validates_length_of :description,:minimum => 5

  def can_validate
    true
  end
end
