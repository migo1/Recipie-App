# spec/models/recipe_food_spec.rb

require 'rails_helper'

RSpec.describe RecipeFood, type: :model do
  let(:food) { FactoryBot.create(:food) } # Create a Food instance using FactoryBot
  let(:recipe) { FactoryBot.create(:recipe) } # Create a Recipe instance using FactoryBot

  # Create a RecipeFood instance using FactoryBot
  subject do
    FactoryBot.create(:recipe_food, recipe:, food:)
  end
  it 'is valid with valid attributes' do
    expect(subject).to be_valid
  end

  it 'is associated with a food' do
    expect(subject.food).to eq(food)
  end

  it 'is associated with a recipe' do
    expect(subject.recipe).to eq(recipe)
  end
end
