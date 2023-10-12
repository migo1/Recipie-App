require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  include Devise::Test::ControllerHelpers

  let(:user) { create(:user) }
  let(:food) { create(:food) }

  describe 'GET #index' do
    it 'renders the index template' do
      get :index
      expect(response).to render_template('foods/index')
    end
  end
end
