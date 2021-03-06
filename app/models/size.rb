class Size < ApplicationRecord
  has_many :items
  self.inheritance_column = :_type_disabled
  enum type: [:select_condition, :adult_xxs, :adult_xs, :adult_s, :adult_m, :adult_l, :adult_ll, :adult_3l, :adult_4l, :adult_5l, :adult_free_size, :adult_shoes_20, :adult_shoes_20_5, :adult_shoes_21, :adult_shoes_21_5, :adult_shoes_22, :adult_shoes_22_5, :adult_shoes_23, :adult_shoes_23_5, :adult_shoes_24, :adult_shoes_24_5, :adult_shoes_25, :adult_shoes_25_5, :adult_shoes_26, :adult_shoes_26_5, :adult_shoes_27, :adult_shoes_27_5, :kids_60, :kids_70, :kids_80, :kids_90, :kids_95, :kids_100, :kids_110, :kids_120, :kids_130, :kids_140, :kids_150, :kids_160, :kids_shoes_10, :kids_shoes_11, :kids_shoes_12, :kids_shoes_13, :kids_shoes_14, :kids_shoes_15, :kids_shoes_16, :kids_shoes_17]
end
