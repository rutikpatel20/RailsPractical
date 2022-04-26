class Product1 < ApplicationRecord
  has_many :order1s, dependent: :destroy
end
