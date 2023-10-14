# spec/requests/foods_spec.rb
require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'GET /foods/new' do
    it 'displays the new food form when the user is logged in' do
      user = FactoryBot.create(:user)
      sign_in user

      get new_food_path

      expect(response).to have_http_status(200)
      expect(response.body).to include('New food')
      #   expect(response.body).to include("Food Name")
      #   expect(response.body).to include("Price")
    end

    it 'redirects to the root path when the user is not logged in' do
      get new_food_path

      expect(response).to have_http_status(302) # Redirect status
      expect(response).to redirect_to(new_user_session_path)
    end
  end
end
