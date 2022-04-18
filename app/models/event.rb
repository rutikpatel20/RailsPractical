class Event < ApplicationRecord
  belongs_to :user
  has_many :enrollments
  has_many :events, through: :enrollments
  belongs_to :category
  has_many :comments
end
