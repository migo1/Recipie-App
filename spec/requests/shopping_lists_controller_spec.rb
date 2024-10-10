# In your spec/controllers/shopping_lists_controller_spec.rb

require 'rails_helper'

RSpec.describe ShoppingListsController, type: :controller do
  # Assuming you're using Devise for user authentication, let's sign in a user for these tests
  include Devise::Test::ControllerHelpers
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  describe 'GET #show' do
    it 'renders the show template' do
      get :show

      expect(response).to render_template(:show)
    end
  end
end
