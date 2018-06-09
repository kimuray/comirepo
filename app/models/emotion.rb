class Emotion < ApplicationRecord
  has_many :selecting_emotions, dependent: :destroy
  has_many :impressions, through: :selecting_emotions
end
