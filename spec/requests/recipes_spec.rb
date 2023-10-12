require 'rails_helper'

RSpec.describe RecipesController, type: :request do
  let(:recipe) { FactoryBot.create(:recipe) }

  describe 'GET #show' do
    it 'responds with a 200 status code' do
      get recipe_path(recipe) # Assuming you have a recipe_path helper
      expect(response).to have_http_status(200)
    end

    it 'renders the show template' do
      get recipe_path(recipe) # Assuming you have a recipe_path helper
      expect(response).to render_template :show
    end
  end
end

RSpec.describe RecipesController, type: :controller do
  describe 'GET #index' do
    it 'responds with a 200 status code' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #new' do
    it 'responds with a 302 status code when a user is not logged in' do
      get :new
      expect(response).to have_http_status(302)
    end
  end

  describe 'GET #index' do
    it 'responds with a 200 status code' do
      get :index
      expect(response).to have_http_status(200)
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template('index')
    end
  end

  describe 'GET #new' do
    it 'responds with a 302 status code when a user is not logged in' do
      get :new
      expect(response).to have_http_status(302)
    end
  end

  # Add more tests for other actions as needed
end
