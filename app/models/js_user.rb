class JsUser < ApplicationRecord
  validates :first_name, :last_name, :email, presence: true
  validates :password, presence: true, on: :create
  validate :pwauthenticate, on: :update

  def pwauthenticate
    user = JsUser.find_by_id(self.id)
    if ((self.password != user.password) && (self.email != user.email))
      errors.add(:base, "Password is incorrect.")
    else
      self.password = user.password
    end
  end
end
