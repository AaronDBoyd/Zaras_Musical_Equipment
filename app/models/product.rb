class Product < ApplicationRecord
  has_many :reviews, dependent: :destroy

  scope :last_three, -> { order(created_at: :desc).limit(3) }
  scope :usa, -> { where(country_of_origin: "USA") }

  validates :name, presence: true
  validates :cost, presence: true
  validates :country_of_origin, presence: true

  before_save(:titleize_product)

  private
    def titleize_product
      self.name = self.name.titleize
    end
end