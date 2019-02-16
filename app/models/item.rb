class Item < ApplicationRecord
  belongs_to :size ,optional: true
  belongs_to :shipping_date
  belongs_to :condition
  belongs_to :region
  belongs_to :ship_method ,optional: true
  belongs_to :delivery_fee
  belongs_to :category
  belongs_to :brand ,optional: true
  has_many :comments
  has_many :item_photos
  accepts_nested_attributes_for :item_photos
  has_many :likes

  belongs_to :saler, class_name: "User" ,optional: true
  belongs_to :buyer, class_name: "User" ,optional: true

  def self.get_items_category(id)
    return Item.where(category_id: id).order("id DESC").first(4)
  end

  def self.get_items_brand(id)
    return Item.where(brand_id: id).order("id DESC").first(4)
  end

end
