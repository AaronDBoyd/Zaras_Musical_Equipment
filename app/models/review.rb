class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :content, presence: true
  validates :rating, presence: true
  validates_length_of :content, within: 50..250

  before_save(:titleize_review)

  private
    def titleize_review
      self.author = self.author.titleize
    end
end