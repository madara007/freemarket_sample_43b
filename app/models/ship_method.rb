class ShipMethod < ApplicationRecord
  has_many :items
  self.inheritance_column = :_type_disabled
  enum type: [:select_ship_method, :undecided, :merukari_flights, :yu_mail, :letter_pack, :ordinary_mail, :kuroneko_yamato, :yu_pack, :click_post, :yu_packet]
end
