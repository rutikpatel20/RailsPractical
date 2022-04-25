class Employee1 < ApplicationRecord
  has_many :address1s
  accepts_nested_attributes_for :address1s
  validates :employee_name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  validates :gender, presence: true
  validates :hobbies, presence: true
  validates :address, presence: true
  validates :mobile_number, length: { is: 10, message: "length should be 10" }, format: { with: /\A[+-]?\d+\z/, message: "must be number" }
  validates :birth_date, comparison: { less_than_or_equal_to: Date.today, message: " can't be in future" }
  validates :document, presence: true
end
