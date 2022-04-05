class Order < ApplicationRecord
  enum :status, [:Booked, :Cancelled]
  belongs_to :myproduct
  belongs_to :customer
end

