class SelectingEmotion < ApplicationRecord
  belongs_to :impression
  belongs_to :emotion
end
