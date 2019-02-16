class Score < ApplicationRecord
  belongs_to :user
  belongs_to :snscredential
  self.inheritance_column = :_type_disabled
end
