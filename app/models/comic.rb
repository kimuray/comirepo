class Comic < ApplicationRecord
  scope :like_title, ->(word) {
    where('title LIKE :word', word: "#{word}%")
  }
  scope :like_title_kana, ->(word) {
    where('title_kana LIKE :word', word: "#{word}%")
  }
  scope :search_title, ->(word) {
    Comic
      .like_title(word)
      .or(Comic.like_title_kana(word))
  }
end
