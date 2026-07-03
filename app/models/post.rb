class Post < ApplicationRecord
  validates :title, presence: true
  validates :title, length: { minimum: 3, maximum: 100 }
  validates :content, presence: true
  validates :title, uniqueness: true  # 同じtitleは1つまで
end