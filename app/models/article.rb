class Article < ApplicationRecord
  scope :title, -> (title) { where title: title }
  scope :starts_with, -> (title) { where("title like ?", "#{title}%") }
end
