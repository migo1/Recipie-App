class RecipesController < ApplicationController
  load_and_authorize_resource
  before_action :set_recipe, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all.order(id: :desc)
  end

  # GET /recipes/1 or /recipes/1.json
  def show; end

  # GET /recipes/new
  def new
    @recipe = Recipe.new

    return if current_user

    flash[:notice] = 'You must be logged in to add a new recipe.'
    redirect_to root_path
  end

  # GET /recipes/1/edit
  def edit
    return if current_user

    flash[:notice] = 'You must be logged in to add a edit recipe.'
    redirect_to root_path
  end

  # POST /recipes or /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)

    respond_to do |format|
      if @recipe.save
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully created.' }
        format.json { render :show, status: :created, location: @recipe }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /recipes/1 or /recipes/1.json
  def update
    respond_to do |format|
      if @recipe.update(recipe_params)
        format.html { redirect_to recipe_url(@recipe), notice: 'Recipe was successfully updated.' }
        format.json { render :show, status: :ok, location: @recipe }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @recipe.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /recipes/1 or /recipes/1.json
  def destroy
    @recipe.foods.destroy_all
    @recipe.destroy

    respond_to do |format|
      format.html { redirect_to recipes_url, notice: 'Recipe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  # recipes_controller.rb
  def toggle
    @recipe = Recipe.find(params[:id])
    @recipe.update(public: !@recipe.public)
    redirect_to @recipe, notice: "Recipe is now #{@recipe.public ? 'public' : 'private'}"
  end

  def generate_shopping_list
    @recipe = Recipe.find(params[:id])
  
    # Calculate missing food items
    @missing_foods = calculate_missing_foods(@recipe)
  
    # Calculate total price of missing food
    @total_price = calculate_total_price(@missing_foods)
  
    render "shopping_list"
  end

  def calculate_missing_foods(recipe)
    # Fetch the general food list of the current user (you may need to adjust this logic)
    general_food_list = current_user.foods

    # Initialize a hash to track the missing foods
    missing_foods = Hash.new(0)

    # Iterate through the recipe's food items
    recipe.recipe_foods.each do |recipe_food|
      general_food = general_food_list.find_by(name: recipe_food.food.name)

      if general_food
        # Calculate the missing quantity
        missing_quantity = recipe_food.quantity - general_food.quantity
        if missing_quantity.positive?
          missing_foods[general_food] = missing_quantity
        end
      else
        # If the general food is not found, consider all of the recipe's food as missing
        missing_foods[recipe_food.food] = recipe_food.quantity
      end
    end

    # Convert the hash into an array of missing foods
    missing_foods.map { |food, quantity| food if quantity.positive? }.compact
  end

  def calculate_total_price(foods)
    # Calculate the total price based on the missing foods (you may adjust the logic)
    total_price = foods.sum { |food| food.price * food.quantity }
    total_price
  end
  
  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end
end
