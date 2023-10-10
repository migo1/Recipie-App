# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# db/seeds.rb

# Create users
User.create(name: "User 1", email: "user1@example.com", password: "password1")
User.create(name: "User 2", email: "user2@example.com", password: "password2")

# Create foods
Food.create(name: "Apple", measurement_unit: "piece", price: 1, quantity: 10, user_id: 1)
Food.create(name: "Banana", measurement_unit: "piece", price: 0.5, quantity: 20, user_id: 2)

# Create recipes
Recipe.create(name: "Fruit Salad", preparation_time: 10, cooking_time: 0, description: "Mix fruits", public: true, user_id: 1)
Recipe.create(name: "Banana Smoothie", preparation_time: 5, cooking_time: 0, description: "Blend bananas", public: false, user_id: 2)


RecipeFood.create(recipe_id: 1, food_id: 1, quantity: 2)  
RecipeFood.create(recipe_id: 1, food_id: 2, quantity: 3)  
RecipeFood.create(recipe_id: 2, food_id: 2, quantity: 2)  
