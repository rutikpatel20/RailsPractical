class User2 < ApplicationRecord
  # model file User2 for Action mailer practical
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  # mount uploader form carrierwave gem
  mount_uploader :picture, PictureUploader
  validates :picture, presence: true
  mount_uploader :resume, ResumeUploader
end
