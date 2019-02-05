# 第1階層
crumb :root do
  link "メルカリ", root_path
end

crumb :support do
  link "メルカリガイド", path
end

# 第2階層
crumb :users do
  link "マイページ", users_path
  parent :root
end

crumb :categorys do
  link "カテゴリー一覧", categorys_path
  parent :root
end

crumb :brands do
  link "ブランド一覧", brands_path
  parent :root
end

crumb :regions do
  link "出品地域一覧", path
  parent :root
end

# 第3階層
# カテゴリー一覧 > カテゴリー１
crumb :category do |category|
  link category.name, category_path
  parent :categorys
end

# ブランド一覧 > ブランド
crumb :brand do |brand|
  link brand.name, brand_path
  parent :brands
end

# リンク名(仮置き)
crumb :item_show do
  link "トップス", item_path
  parent :root
end

crumb :notification do
  link "お知らせ", path
  parent :users
end

crumb :todo do
  link "やることリスト", path
  parent :users
end

crumb :likes do
  link "いいね！一覧", path
  parent :users
end

crumb :listing do
  link "出品した商品・出品中", path
  parent :users
end

crumb :in_progress do
  link "出品した商品・取引中", path
  parent :users
end

crumb :completed do
  link "出品した商品・売却済み", path
  parent :users
end

crumb :purchase do
  link "購入した商品・取引中", path
  parent :users
end

crumb :purchased do
  link "購入した商品・過去の取引", path
  parent :users
end

crumb :news do
  link "ニュース一覧", path
  parent :users
end

crumb :score do
  link "評価一覧", path
  parent :users
end

crumb :help_center do
  link "お問い合わせ", path
  parent :users
end

crumb :sales do
  link "売上・振込申請", path
  parent :users
end

crumb :point do
  link "ポイント", path
  parent :users
end

crumb :profile do
  link "プロフィール", path
  parent :users
end

crumb :deliver_addres do
  link "住所変更", path
  parent :users
end

crumb :credit do
  link "支払い方法", new_credit_path
  parent :users
end

crumb :email_password do
  link "メール/パスワード", path
  parent :users
end

crumb :identification do
  link "本人情報の登録", user_path
  parent :users
end

crumb :sms_confirmation do
  link "電話番号の確認", path
  parent :users
end

crumb :logout do
  link "ログアウト", path
  parent :users
end

# 第4階層
# カテゴリー一覧 > カテゴリー１ > カテゴリー２
crumb :category_second do |category|
  link category.name, category_path
  parent :category
end

# ブランド一覧 > ブランド > カテゴリー
crumb :brand do |brand|
  link category.name, brand_path
  parent :brands
end

# 第5階層
# カテゴリー一覧 > カテゴリー１ > カテゴリー２ > カテゴリー３
crumb :category_third do |category|
  link category.name, category_path
  parent :category_third
end
