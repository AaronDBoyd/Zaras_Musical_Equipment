class Review < ApplicationRecord
  belongs_to :product
  validates :author, presence: true
  validates :content, presence: true
  validates :rating, presence: true
  validates_length_of :content, within: 50..250, too_short: "Leave a longer review.", too_long: "Review is too long."

  before_save(:titleize_review)

  private
    def titleize_review
      self.author = self.author.titleize
    end
end