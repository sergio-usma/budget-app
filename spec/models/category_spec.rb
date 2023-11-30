require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category, author_id: user.id) }

  describe 'Validations' do
    it 'Category has to be valid' do
      expect(category).to be_valid
    end
    it 'Category has not to be valid' do
      expect(build(:category)).not_to be_valid
    end
    it 'Category has not to be valid without icon' do
      expect(build(:category, author_id: user.id, icon: '')).not_to be_valid
    end
  end

  describe 'Associations' do
    it 'should belongs to User class' do
      expect(Category.reflect_on_association(:author).macro).to eq :belongs_to
    end
    it 'should have many categoryMovements' do
      expect(Category.reflect_on_association(:category_movements).macro).to eq :has_many
    end
  end
end
