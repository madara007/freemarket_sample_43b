json.array! @categories do |category|
  json.id category.id
  json.name category.name_i18n
end
