# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Product.destroy_all
Category.destory_all

book_category = Category.create!(title: 'Book')
programming_category = Category.create!(title: 'Programming')
Product.create!(title: 'Ruby Book', description: 'Learn Ruby Programming', price: 12.99, published:true, category: book_category)
Product.create!(title: 'jQuery Book', description: 'Learn jQuery', price: 11.99, published: true, category: book_category)
Product.create!(title: 'SASS Book', description: 'Learn CSS with SASS', price: 19.99, published: true, category: programming_category)
