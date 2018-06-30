class Comic < ApplicationRecord
  scope :like_title_kana, ->(word) {
    where('title_kana LIKE :word', word: "%#{word}%")
  }
end
