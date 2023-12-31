require 'rails_helper'

RSpec.describe Recipe, type: :model do
  describe 'associations' do
    it 'belongs to a user' do
      association = described_class.reflect_on_association(:user)
      expect(association.macro).to eq :belongs_to
    end

    it 'has many recipe foods' do
      association = described_class.reflect_on_association(:recipe_foods)
      expect(association.macro).to eq :has_many
    end

    it 'has many foods through recipe foods' do
      association = described_class.reflect_on_association(:foods)
      expect(association.macro).to eq :has_many
      expect(association.options[:through]).to eq :recipe_foods
    end
  end
end
