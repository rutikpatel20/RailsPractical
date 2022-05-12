class Rproduct < ApplicationRecord
  has_many :rorders
  validates :title, presence: true
  validates :description, presence: true
  validates :price, presence: true, numericality: true
end
