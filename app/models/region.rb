class Region < ApplicationRecord
  has_many :items
  enum name: [:select_region, :hokkaido, :aomori, :iwate, :miyagi, :akita, :yamagata, :fukushima, :ibaraki, :tochigi, :gunma, :saitama, :chiba, :tokyo, :kanagawa, :niigata, :toyama, :ishikawa, :fukui, :yamanashi, :nagano, :gifu, :shizuoka, :aichi, :mie, :shiga, :kyoto, :osaka, :hyogo, :nara, :wakayama, :tottori, :shimane, :okayama, :hiroshima, :yamaguchi, :tokushima, :kagawa, :ehime, :kochi, :fukuoka, :saga, :nagasaki, :kumamoto, :oita, :miyazaki, :kagoshima, :okinawa, :otherwise]

  scope :get_hokkaido, -> {Region.first}
  scope :get_tohoku, -> {Region.where(id: 2..7)}
  scope :get_kanto, -> {Region.where(id: 8..14)}
  scope :get_hokuriku, -> {Region.where(id: 15..18)}
  scope :get_tyubu, -> {Region.where(id: 19..23)}
  scope :get_kinki, -> {Region.where(id: 24..30)}
  scope :get_tyugoku, -> {Region.where(id: 31..35)}
  scope :get_sikoku, -> {Region.where(id: 36..39)}
  scope :get_kyusyu,-> {Region.where(id: 40..47)}
end
