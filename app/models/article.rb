class Article < ApplicationRecord
scope :title, -> (title) { where title: title }
end
