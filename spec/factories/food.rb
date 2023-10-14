FactoryBot.define do
  factory :food do
    name { 'Example Food' }
    measurement_unit { 'grams' }
    price { 10 }
    quantity { 100 }
    user { create(:user) } # Create a User for the Food
  end
end
