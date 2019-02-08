class Condition < ApplicationRecord
  has_many :items
  self.inheritance_column = :_type_disabled
  enum type: [:select_condition, :new_item, :unused, :no_dirt, :little_dirt, :yes_dirt, :bad]
end
