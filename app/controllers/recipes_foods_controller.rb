class RecipesFoodsController < ApplicationController
  before_action :find_recipe

  def new
    @recipe_food = RecipeFood.new(recipe_id: @recipe.id)
    @foods = Food.all
  end

  def create
    @recipes_food = RecipeFood.new(recipe_food_params)
    @foods = Food.all
    if @recipes_food.save
      redirect_to recipe_path(@recipe), notice: 'Ingridient was successfully created.'
    else
      render :new
    end
  end

  private

  def recipe_food_params
    params.require(:recipe_food).permit(:recipe_id, :quantity, :food_id)
  end

  def find_recipe
    @recipe = Recipe.find(params[:recipe_id])
  end
end
