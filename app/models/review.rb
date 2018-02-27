class Review < ApplicationRecord
  belongs_to :user
  belongs_to :product

  validates :rating, presence: true
  validates :rating, presence: true, inclusion: { in: [0, 1, 2, 3, 4, 5]}
end
