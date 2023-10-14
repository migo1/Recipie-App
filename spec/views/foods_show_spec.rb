# spec/requests/foods_show_spec.rb
require 'rails_helper'

RSpec.describe 'Foods Show', type: :request do
  describe 'GET /foods/:id' do
    let(:user) { FactoryBot.create(:user) }
    let(:food) { FactoryBot.create(:food) }

    before do
      sign_in user
    end

    it 'displays the food details' do
      get food_path(food)

      expect(response).to have_http_status(200)
      expect(response.body).to include(food.name)
      expect(response.body).to include("$#{food.price}")
      expect(response.body).to include("Created by: #{food.user.name}")
    end

    it "displays 'Add recipes' button" do
      get food_path(food)

      expect(response).to have_http_status(200)
      expect(response.body).to include('Add recipes')
      expect(response.body).to include(new_food_recipes_food_path(food))
    end

    it 'displays a table of associated recipes' do
      recipe = FactoryBot.create(:recipe)
      recipe_food = FactoryBot.create(:recipe_food, food:, recipe:)

      get food_path(food)

      expect(response).to have_http_status(200)
      expect(response.body).to include('Recipes')
      expect(response.body).to include(recipe.name)
      expect(response.body).to include(recipe_food.quantity.to_s)
    end
  end
end
