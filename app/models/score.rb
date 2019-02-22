class Score < ApplicationRecord
  belongs_to :user
  belongs_to :snscredential
  self.inheritance_column = :_type_disabled
  validates :type, inclusion: { in: [1, 2, 3], message: "評価を選択してください。" }
end
