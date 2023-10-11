class RecipesController < ApplicationController
  load_and_authorize_resource
  before_action :set_recipe, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]
  # before_action :current_user!, only: %i[edit update destroy]

  # GET /recipes or /recipes.json
  def index
    @recipes = Recipe.all
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

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_recipe
    @recipe = Recipe.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def recipe_params
    params.require(:recipe).permit(:name, :preparation_time, :cooking_time, :description, :public, :user_id)
  end

  # def current_user!
  #   @recipe = current_user.recipes.find_by(id: params[:id])

  #   return unless @recipe.nil?

  #   redirect_to recipes_path, notice: 'Not authorized to edit this recipe'
  # end
end
