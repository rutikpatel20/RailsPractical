class Category < ApplicationRecord
  has_many :events
  belongs_to :user
  validates :category_name, uniqueness: true
end
