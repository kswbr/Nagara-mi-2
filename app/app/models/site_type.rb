class SiteType < ApplicationRecord
  validates :name, :presence => true,:uniqueness => true
  has_many :sites
end
