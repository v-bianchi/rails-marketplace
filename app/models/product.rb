class Product < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  validates :title, presence: true
  validates :price, presence: true

  mount_uploader :picture, PhotoUploader
end
