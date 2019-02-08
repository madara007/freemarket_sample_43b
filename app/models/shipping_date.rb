class ShippingDate < ApplicationRecord
  has_many :items
  enum day: [:select_sipping_date, :within_2days, :within_3days, :within_4days]
end
