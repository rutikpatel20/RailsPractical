class Book < ApplicationRecord
    validates :name, presence: true
    validates :price, presence: true
    belongs_to :author
    has_many :images, as: :imageable
end
