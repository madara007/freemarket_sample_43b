class Item < ApplicationRecord
  belongs_to :size ,optional: true
  belongs_to :shipping_date
  belongs_to :condition
  belongs_to :region
  belongs_to :ship_method ,optional: true
  belongs_to :delivery_fee
  belongs_to :category
  belongs_to :brand ,optional: true
  has_many :comments, dependent: :destroy
  has_many :item_photos, dependent: :destroy
  accepts_nested_attributes_for :item_photos
  has_many :likes, dependent: :destroy
  has_many :snslikes
  has_many :scores
  has_many :snscredential
  validates :name, presence: true
  validates :name, length: { maximum: 40 }
  validates :price, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :description, length: { maximum: 1000 }
  validates :category_id, presence: true
  validates :saler_id, presence: true
  validates :shipping_date_id, presence: true
  validates :condition_id, presence: true
  validates :region_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :ship_method_id, presence: true
  validates :item_photos, length: { minimum: 1 }

  scope :item_saler_list, -> (trading, current_user) { where(trading: trading, saler_id: current_user).order(updated_at: "DESC") }
  scope :item_buyer_list, -> (trading, current_user) { where(trading: trading, buyer_id: current_user).order(updated_at: "DESC") }

  def like_user(id)
    likes.find_by(user_id: id)
  end

   def like_sns(id)
    snslikes.find_by(snscredential_id: id)
  end

  belongs_to :saler, class_name: "User" ,optional: true
  belongs_to :buyer, class_name: "User" ,optional: true

  def self.get_items_category(id)
    return Item.where(category_id: id).order("id DESC").first(4)
  end

  def self.get_items_brand(id)
    return Item.where(brand_id: id).order("id DESC").first(4)
  end

end
