class Product < ApplicationRecord
  belongs_to :user
  has_many :reviews

  validates :title, presence: true
  validates :rating, inclusion: { in: (0..5) }

  mount_uploader :picture, PhotoUploader
end
