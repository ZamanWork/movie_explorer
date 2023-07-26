# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
10.times do
  Movie.create!(
    title: Faker::Movie.title,
    release_year: Faker::Number.between(from: 1900, to: 2023),
    plot: Faker::Movie.quote,
    poster_url: Faker::Internet.url
  )
end

# Seed Ratings
movies = Movie.all
movies.each do |movie|
  3.times do
    Rating.create!(
      movie: movie,
      user: 'user123', # Replace 'user123' with the user's name or ID (when you have authentication)
      value: Faker::Number.between(from: 1, to: 10)
    )
  end
end

# Seed Comments
movies.each do |movie|
  2.times do
    Comment.create!(
      movie: movie,
      user: 'user123', # Replace 'user123' with the user's name or ID (when you have authentication)
      text: Faker::Lorem.paragraph
    )
  end
end
