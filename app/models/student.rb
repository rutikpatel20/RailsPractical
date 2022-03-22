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

  # Callbacks
  after_initialize do |student|
    puts "------You have initialized an object of Student!------"
  end

  after_find do |student|
    puts "------You have found an object in Student!------"
  end

  after_create do |student|
    puts "------You have Successfully created Student!------"
  end
  
  after_update do |student|
    puts "------You have Successfully Updated Student!------"
  end

  before_validation :birthdate
    puts "------This Callback is running before validating birthdate------"

  after_validation :birthdate
    puts "------This Callback is running after validating birthdate------"

  after_save :email_student
    
  def email_student
    puts "------This Callback is running after validating email - Email Validated------"
  end
    
  after_destroy :destroy_student, if: Proc.new { |student| student.department == "IT" }

  def destroy_student
    puts "------Student destroyed successfully------"
  end

end
