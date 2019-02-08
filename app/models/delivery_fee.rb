class DeliveryFee < ApplicationRecord
  has_many :items
  self.inheritance_column = :_type_disabled
  enum type: [:select_delivery_fee, :postage_included, :freight_collect]
end
