# 第1階層
crumb :root do
  link "メルカリ", root_path
end

crumb :support do
  link "メルカリガイド"
end

# 第2階層
crumb :users do
  link "マイページ", users_path
  parent :root
end

crumb :categories do
  link "カテゴリー一覧", categories_path
  parent :root
end

crumb :brands do
  link "ブランド一覧", brands_path
  parent :root
end

crumb :regions do
  link "出品地域一覧", regions_path
  parent :root
end

crumb :users_page do |user|
  link user.nickname
  parent :root
end

# 商品詳細
crumb :item_show do |item|
  link item.name
  parent :root
end

# 第3階層
# カテゴリー一覧 > カテゴリー
crumb :category do |category|
  link category.name_i18n, category
  if category.parent
    parent category.parent
  else
    parent :categories
  end
end

# ブランド一覧 > ブランド
crumb :brand do |brand|
  link brand.name, brand_path(brand)
  parent :brands
end

# 出品地域一覧 > 地域名
crumb :region do |region|
  link region.name_i18n
  parent :regions
end

crumb :notification do
  link "お知らせ"
  parent :users
end

crumb :todo do
  link "やることリスト"
  parent :users
end

crumb :likes do
  link "いいね！一覧"
  parent :users
end

crumb :selling do
  link "出品した商品"
  parent :users
end

crumb :purchase do
  link "購入した商品"
  parent :users
end

crumb :news do
  link "ニュース一覧"
  parent :users
end

crumb :score do
  link "評価一覧"
  parent :users
end

crumb :help_center do
  link "お問い合わせ"
  parent :users
end

crumb :sales do
  link "売上・振込申請"
  parent :users
end

crumb :point do
  link "ポイント"
  parent :users
end

crumb :profile do
  link "プロフィール"
  parent :users
end

crumb :deliver_addres do
  link "住所変更"
  parent :users
end

crumb :credit do
  link "支払い方法"
  parent :users
end

crumb :email_password do
  link "メール/パスワード"
  parent :users
end

crumb :identification do
  link "本人情報の登録"
  parent :users
end

crumb :sms_confirmation do
  link "電話番号の確認"
  parent :users
end

crumb :logout do
  link "ログアウト"
  parent :users
end
