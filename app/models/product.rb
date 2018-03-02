class Product < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :price, presence: true, numericality: { less_than_or_equal_to: 5 }

  mount_uploader :picture, PhotoUploader
end
