# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.create(email: "test@example.com", password: "test123", full_name: "Jim Halpert")
User.create(email: "hais@enberg.com", password: "test123", full_name: "Walter White")
User.create(email: "f@riend.com", password: "test123", full_name: "Chanandler Bong")

Tweet.create(body: "Do you guys have som pseudo for sell?", user_id: User.find_by(email: "hais@enberg.com").id)
Comment.create(text: "let me check. I have lots of pills...", tweet_id: 1, user_id: User.find_by(email: "f@riend.com").id)
Comment.create(text: "Your pills are swimming in jelly! XDDD", tweet_id: 1, user_id: User.find_by(email: "test@example.com").id)