# spec/requests/foods_spec.rb
require 'rails_helper'

RSpec.describe 'Foods', type: :request do
  describe 'GET /foods' do
    it 'displays the list of foods' do
      FactoryBot.create(:food, name: 'Food 1')
      FactoryBot.create(:food, name: 'Food 2')

      get foods_path

      expect(response).to have_http_status(200)
      expect(response.body).to include('Food 1')
      expect(response.body).to include('Food 2')
    end
  end
end
