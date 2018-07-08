class Inquiry < ApplicationRecord
  enumerize :kind, in: { how_use: 1, bug_report: 2, slander: 3, other: 4 }

  validates :kind, presence: true
  validates :email, presence: true
  validates :name, presence: true
  validates :content, presence: true
end
