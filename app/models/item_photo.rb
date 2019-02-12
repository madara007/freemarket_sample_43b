class ItemPhoto < ApplicationRecord
  belongs_to :item
  mount_uploader :photo, ImageUploader
end
