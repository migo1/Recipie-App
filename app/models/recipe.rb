class Recipe < ApplicationRecord
  belongs_to :user
  has_many :recipe_foods
  has_many :foods, through: :recipe_foods

    def total_cost
    total = 0
    self.recipe_foods.each do |recipe_food|
      total += recipe_food.food.price * recipe_food.quantity
    end
    total
  end
end
