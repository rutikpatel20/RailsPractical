class Author < ApplicationRecord
    validates :firstname, presence: true
    validates :lastname, presence: true
    validates :dob, presence: true
    validates :email, presence: true , format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

    has_many :books, dependent: :destroy
    has_many :images, as: :imageable
end
