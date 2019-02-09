class Item < ApplicationRecord
  belongs_to :user
  belongs_to :size
  belongs_to :shipping_date
  belongs_to :condition
  belongs_to :region
  belongs_to :ship_method
  belongs_to :delivery_fee
  belongs_to :category
  belongs_to :brand

  has_many :item_photos
  has_many :likes
  belongs_to :saler, class_name: "User"
  belongs_to :buyer, class_name: "User"

  def self.get_items_category(id)
    return Item.where(category_id: id).order("id DESC").first(4)
  end

  def self.get_items_brand(id)
    return Item.where(brand_id: id).order("id DESC").first(4)
  end

end
