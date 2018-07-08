class Impression < ApplicationRecord
  belongs_to :user
  belongs_to :comic
  has_many :selecting_emotions, dependent: :destroy
  has_many :emotions, through: :selecting_emotions

  counter_culture :comic

  mount_base64_uploader :capture, CaptureUploader

  validates :comic_title, presence: true
  validates :capture, presence: true
  validates :report, presence: true, length: { maximum: 800 }

  def set_comic_and_save
    comic_instance = find_or_create_comic
    self.comic_id = comic_instance.id
    save
  end

  private

  def find_or_create_comic
    Comic.find_or_create_by(title: self.comic_title)
  end
end
