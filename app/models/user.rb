class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :scores
  has_many :likes
  has_many :items, foreign_key: 'saler_id'
  has_many :comments
  has_one :profile, dependent: :destroy
  accepts_nested_attributes_for :profile
  validates_associated :profile
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, uniqueness: true, format: { with: VALID_EMAIL_REGEX }
  validates :encrypted_password, presence: true
  validates :password, length: { in: 6..128, message: "パスワードは6文字以上128文字以下で入力してください" }
end
