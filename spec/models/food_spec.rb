require 'rails_helper'

RSpec.describe Food, type: :model do
  it 'is valid with valid attributes' do
    food = Food.new(
      name: 'Example Food',
      measurement_unit: 'Grams',
      price: 10.0,
      quantity: 100,
      user: FactoryBot.create(:user) # Use FactoryBot to create a user instance
    )
    expect(food).to be_valid
  end

  it 'is not valid without a name' do
    food = Food.new(name: nil)
    expect(food).to_not be_valid
  end

  it 'is not valid without a measurement_unit' do
    food = Food.new(measurement_unit: nil)
    expect(food).to_not be_valid
  end

  it 'is not valid without a price' do
    food = Food.new(price: nil)
    expect(food).to_not be_valid
  end

  it 'is not valid without a quantity' do
    food = Food.new(quantity: nil)
    expect(food).to_not be_valid
  end

  it 'belongs to a user' do
    user = FactoryBot.create(:user) # Use FactoryBot to create a user instance
    food = Food.new(user:)
    expect(food.user).to eq(user)
  end
end
