# spec/features/recipes_show_spec.rb

require 'rails_helper'

RSpec.feature 'Recipes Show Page' do
  let(:user) { FactoryBot.create(:user) }
  let(:recipe) { FactoryBot.create(:recipe) }

  def sign_in(user)
    visit new_user_session_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'
  end

  before do
    sign_in user # Sign in the user before each test
    visit recipe_path(recipe)
  end

  scenario 'displays recipe details' do
    expect(page).to have_content(recipe.name)
    expect(page).to have_content(recipe.created_at.strftime('%d %b %y'))
    expect(page).to have_content("Preparation time: #{recipe.preparation_time}")
    expect(page).to have_content("Cooking time: #{recipe.cooking_time}")
  end
end
