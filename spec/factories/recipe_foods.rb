# spec/factories/recipe_foods.rb

FactoryBot.define do
  factory :recipe_food do
    # Create a Food instance with a valid User
    food { create(:food, user: create(:user)) }

    # Create a Recipe instance with a valid User
    recipe { create(:recipe, user: create(:user)) }

    quantity { 2 } # Adjust the quantity as needed
  end
end
