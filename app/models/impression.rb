class Impression < ApplicationRecord
  belongs_to :user
  has_many :selecting_emotions, dependent: :destroy
  has_many :emotions, through: :selecting_emotions

  mount_base64_uploader :capture, CaptureUploader

  validates :comic_title, presence: true
  validates :best_scene, presence: true
  validates :capture, presence: true
  validates :report, presence: true, length: { maximum: 800 }
end
