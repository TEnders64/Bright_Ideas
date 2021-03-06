class Idea < ActiveRecord::Base
  belongs_to :user
  # has_many :likes, order: {count: :desc}, dependent: :destroy
  # has_many :likes, -> { order(count: :desc) }, dependent: :destroy
  has_many :likes, dependent: :destroy
  has_many :liking_users, through: :likes, source: :user
  validates :content, presence: true
end
