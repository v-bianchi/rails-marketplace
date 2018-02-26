class Product < ApplicationRecord
  belongs_to :user
  has_many :reviews

  validates :title, presence: true

  mount_uploader :picture, PhotoUploader
end
