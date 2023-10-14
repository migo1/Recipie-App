# spec/features/recipes_index_spec.rb

require 'rails_helper'

RSpec.feature 'Recipes Index Page' do
  scenario 'when the user is not signed in' do
    visit recipes_path

    expect(page).to have_selector('h1', text: 'Public Recipes')

    expect(page).not_to have_link('New recipe')
  end
end
