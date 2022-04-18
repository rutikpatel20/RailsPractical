class User < ApplicationRecord
  # adds virtual attributes for authentication
  has_secure_password
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: 'Invalid email' }
  has_many :enrollments
  has_many :events, through: :enrollments
  has_many :categories
  has_one :address
  accepts_nested_attributes_for :address
  has_many :comments
end
