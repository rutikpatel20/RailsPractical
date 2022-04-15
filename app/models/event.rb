class Event < ApplicationRecord
  belongs_to :user
  has_many :enrollments
  has_many :events, through: :enrollments
  # has_many :enroll_events, through: :enrollments, source: :user
  belongs_to :category
  has_many :comments
end
