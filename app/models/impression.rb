class Impression < ApplicationRecord
  belongs_to :user
  has_many :selecting_emotions, dependent: :destroy
  has_many :emotions, through: :selecting_emotions

  mount_base64_uploader :capture, CaptureUploader
end
