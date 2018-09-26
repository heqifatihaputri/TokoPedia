class SubCategory < ApplicationRecord
  belongs_to :category
  has_many :products
  has_many :searches
end
