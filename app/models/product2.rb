class Product2 < ApplicationRecord
  belongs_to :user1
  validates :product_name, presence: true, uniqueness: true
  validates :description, length: { in: 10..50 }
end
