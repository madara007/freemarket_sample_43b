if Rails.env.development? || Rails.env.test?
  Bullet.add_whitelist type: :n_plus_one_query, class_name: "Category", association: :children
  Bullet.add_whitelist type: :unused_eager_loading, class_name: "Category", association: :children
  Bullet.add_whitelist type: :n_plus_one_query, class_name: 'Item', association: :snslikes
  Bullet.add_whitelist type: :unused_eager_loading, class_name: 'Item', association: :snslikesend
end
