class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :content, presence: true
  validates :rating, presence: true
end