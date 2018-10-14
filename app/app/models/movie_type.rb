class MovieType < ApplicationRecord
  validates :title, :presence => true, :uniqueness => true
  validates :url, :presence => true
  has_many :movies
end
