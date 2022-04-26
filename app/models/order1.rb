class Order1 < ApplicationRecord
  validates :quantity, presence: true
  belongs_to :product1
end
