class Region < ApplicationRecord
  has_many :items
  enum name: [:select_region, :hokkaido, :aomori, :iwate, :miyagi, :akita, :yamagata, :fukushima, :ibaraki, :tochigi, :gunma, :saitama, :chiba, :tokyo, :kanagawa, :niigata, :toyama, :ishikawa, :fukui, :yamanashi, :nagano, :gifu, :shizuoka, :aichi, :mie, :shiga, :kyoto, :osaka, :hyogo, :nara, :wakayama, :tottori, :shimane, :okayama, :hiroshima, :yamaguchi, :tokushima, :kagawa, :ehime, :kochi, :fukuoka, :saga, :nagasaki, :kumamoto, :oita, :miyazaki, :kagoshima, :okinawa, :otherwise]

  def self.get_hokkaido
    return Region.find(1)
  end

  def self.get_tohoku
    return Region.where(id: 2..7)
  end

  def self.get_kanto
    return Region.where(id: 8..14)
  end

  def self.get_hokuriku
    return Region.where(id: 15..18)
  end

  def self.get_tyubu
    return Region.where(id: 19..23)
  end

  def self.get_kinki
    return Region.where(id: 24..30)
  end

  def self.get_tyugoku
    return Region.where(id: 31..35)
  end

  def self.get_sikoku
    return  Region.where(id: 36..39)
  end

  def self.get_kyusyu
    return Region.where(id: 40..47)
  end
end
