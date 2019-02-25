class Profile < ApplicationRecord
  belongs_to :user
  VALID_KANA_REGEX = /[ァ-ヴ][ァ-ヴー・]*/
  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: VALID_KANA_REGEX , message: "カナで入力してください。" }
  validates :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX , message: "カナで入力してください。" }
  validates :birthday, presence: true
end
