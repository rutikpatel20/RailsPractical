class Student < ApplicationRecord
  validates :firstname,
            presence: true
            
  validates :lastname,
            presence: true

  validates :phone_number,
            length: { is: 10, message: 'length should be 10' },
            format: { with: /\A[+-]?\d+\z/, message: 'must be number' }

  validates :email,
            presence: true,
            uniqueness: true,
            format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }
  
  validates :birthdate,
            comparison: { less_than_or_equal_to: Date.today, message: " can't be in future" }
  
  validates :department,
            inclusion: { in: %w(CE IT), message: "can't be %{value}" }
  
  validates :terms_of_usage,
            acceptance: { message: 'You cannot proceed without accepting Terms of Usage' }

end
