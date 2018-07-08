class Inquiry < ApplicationRecord
  validates :kind, presence: true
  validates :email, presence: true
  validates :name, presence: true
  validates :content, presence: true
end
