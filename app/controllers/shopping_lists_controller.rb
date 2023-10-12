class ShoppingListsController < ApplicationController
  def show
    @missing_foods = generate_missing_foods_list(current_user)
    @total_missing_items = calculate_total_missing_items(@missing_foods)
    @total_missing_price = calculate_total_missing_price(@missing_foods)
    # Ensure @missing_foods is not nil
    @missing_foods ||= []
  end

  private

  def generate_missing_foods_list(user)
    # Implement the logic to calculate missing food items for the user's recipes here
    user_recipes = user.recipes
    user_food_ids = user.foods.pluck(:id)
    user_recipes.each_with_object([]) do |recipe, result|
      recipe.recipe_foods.each do |recipe_food|
        result << recipe_food.food unless user_food_ids.include?(recipe_food.food_id)
      end
    end
  end

  def calculate_total_missing_items(missing_foods)
    missing_foods.count
  end

  def calculate_total_missing_price(missing_foods)
    missing_foods.sum(&:price)
  end
end
