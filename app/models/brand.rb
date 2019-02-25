class Brand < ApplicationRecord
  has_many :items

  scope :chanel, -> {Brand.find(2440)}
  scope :nike, -> {Brand.find(3802)}
  scope :puma, -> {Brand.find(4790)}
  scope :vuitton, -> {Brand.find(6142)}
end
