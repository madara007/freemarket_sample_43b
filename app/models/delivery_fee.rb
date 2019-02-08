class DeliveryFee < ApplicationRecord
  has_many :items
  self.inheritance_column = :_type_disabled
end
