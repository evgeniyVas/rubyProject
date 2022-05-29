# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

def create_news(args)
  news = News.new(args)
  news.save!
  news
end

def create_comment(news, args)
  comment = news.comments.build(args)
  comment.save!
end

if User.all.empty?
  User.create!(email: 'admin@admin.ru', admin: true, password: 123_123, password_confirmation: 123_123)
  User.create!(email: 'simpleMan@mail.ru', password: 222_222, password_confirmation: 222_222)
end
if News.all.empty?
  n = create_news(name: Faker::Games::Witcher.book, body: Faker::Games::Witcher.quote)
  u = User.where(admin: false).last
  create_comment(n, body: Faker::Games::Witcher.quote, user: u)
  create_comment(n, body: Faker::Games::Witcher.quote, user: u)

  n = create_news(name: Faker::Games::Witcher.book, body: Faker::Games::Witcher.quote)
  create_comment(n, body: Faker::Games::Witcher.quote, user: u)
  create_comment(n, body: Faker::Games::Witcher.quote, user: u)

  n = create_news(name: Faker::Games::Witcher.book, body: Faker::Games::Witcher.quote)
  create_comment(n, body: Faker::Games::Witcher.quote, user: u)
  create_comment(n, body: Faker::Games::Witcher.quote, user: u)

  n = create_news(name: Faker::Games::Witcher.book, body: Faker::Games::Witcher.quote)
  create_comment(n, body: Faker::Games::Witcher.quote, user: u)
  create_comment(n, body: Faker::Games::Witcher.quote, user: u)

end
