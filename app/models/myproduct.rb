class Myproduct < ApplicationRecord
  enum :status, {"In Stock":1, "Out Of Stock":2, ComingSoon:0}
  default_scope {where('is_active =?',true)}
  has_many :orders
end
