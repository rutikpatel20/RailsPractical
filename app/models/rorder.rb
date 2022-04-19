class Rorder < ApplicationRecord
  belongs_to :rproduct
  validates :quantity, presence: true, numericality: true
end
