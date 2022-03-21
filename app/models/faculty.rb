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

end
