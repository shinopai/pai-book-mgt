# # book_formats用 書籍形式
# format_names = [
#   '単行本',
#   '文庫本',
#   'ペーパーバック'
# ]

# format_names.size.times do |i|
#   BookFormat.create(
#     name: format_names[i]
#   )
# end

# # book_languages用 書籍言語
# language_names = [
#   '日本語',
#   '英語',
#   '韓国語',
#   '中国語',
#   'ロシア語',
#   'フランス語',
#   'ドイツ語'
# ]

# language_names.size.times do |i|
#   BookLanguage.create(
#     name: language_names[i]
#   )
# end

# publishers用 出版社
publisher_names = [
  '講談社',
  '集英社',
  '小学館',
  'KADOKAWA',
  '文藝春秋',
  '新潮社',
]

publisher_names.size.times do |i|
  Publisher.create(
    name: publisher_names[i]
  )
end
