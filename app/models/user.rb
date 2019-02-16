class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :scores
  has_many :likes
  has_many :items, foreign_key: 'saler_id'
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  VALID_KANA_REGEX = /[ァ-ヴ][ァ-ヴー・]*/
  validates :nickname, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :encrypted_password, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_kana, presence: true, format: { with: VALID_KANA_REGEX , message: "カナで入力してください。" }
  validates :first_name_kana, presence: true, format: { with: VALID_KANA_REGEX , message: "カナで入力してください。" }
  validates :password, length: { in: 6..128, message: "パスワードは6文字以上128文字以下で入力してください" }
  validates :birthday, presence: true
end
