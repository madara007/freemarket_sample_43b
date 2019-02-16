class Like < ApplicationRecord
  belongs_to :user, counter_cache: :likes_count
  belongs_to :snscredential, counter_cache: :likes_count
  belongs_to :item
end
