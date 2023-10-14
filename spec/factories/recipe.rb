FactoryBot.define do
  factory :recipe do
    name { 'Example Recipe' }
    preparation_time { 30 }
    cooking_time { 60 }
    description { 'This is a sample recipe.' }
    public { true }
    user { create(:user) } # Create a User for the Recipe
  end
end
