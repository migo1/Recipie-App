class RecipesFoodsController < ApplicationController
  before_action :find_food

  def new
    @recipe_food = RecipeFood.new(food_id: @food.id)
    @recipes = Recipe.all
  end

  def create
    @recipes_food = RecipeFood.new(recipe_food_params)
    @recipes = Recipe.all
    if @recipes_food.save
      redirect_to food_path(@food)
    else
      render :new
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:recipe_id, :quantity, :food_id)
  end

  def find_food
    @food = Food.find(params[:food_id])
  end
end
