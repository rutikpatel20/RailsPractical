class Faculty < ApplicationRecord
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
            comparison: { less_than_or_equal_to: Date.today, message: " can't be in future"}

  validate :designation_faculty


  # For validate designation of faculty
  def designation_faculty
    if (designation == "Ass. Prof." || designation == "Prof.")
    elsif (designation == "HOD" || designation == "Sr. Prof.")
      errors.add(:designation, " not allowed as HOD & Sr. Prof.")
    else
      errors.add(:designation, "must be Ass.Prof. Or Prof. ")
    end
  end

  # Callbacks
  after_initialize do |faculty|
    puts "------You have initialized an object of Faculty!------"
  end

  after_find do |faculty|
    puts "------You have found an object in Faculty!------"
  end

  after_create do |faculty|
    puts "------This Callback is running after creating the Faculty------"
  end

  after_touch do |faculty|
    puts "------This Callback is running after Touching the Faculty------"
  end
  
  after_update do |faculty|
    puts "------This Callback is running after Updating the Faculty------"
  end

  after_destroy do |faculty|
    puts "------This Callback is running after Destroying the Faculty------"
  end

  after_validation :birthdate
    puts "------This Callback is running after validating birthdate - Birthdate is valid------"

  after_commit do |faculty|
    puts "------This Callback is running after Commit in the Faculty------"
  end

end
