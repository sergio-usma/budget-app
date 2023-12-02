require 'rails_helper'

RSpec.describe Movement, type: :model do
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }

  it 'is valid with valid attributes' do
    movement = build(:movement, author: user, categories: [category])
    expect(movement).to be_valid
  end

  it 'is not valid without an amount' do
    movement = build(:movement, amount: nil, author: user, categories: [category])
    expect(movement).to_not be_valid
  end

  it 'is not valid without a name' do
    movement = build(:movement, name: nil, author: user, categories: [category])
    expect(movement).to_not be_valid
  end

  it 'is not valid without associated categories' do
    movement = build(:movement, author: user, categories: [])
    expect(movement).to_not be_valid
  end

  it 'belongs to an author (user)' do
    association = described_class.reflect_on_association(:author)
    expect(association.macro).to eq(:belongs_to)
  end

  it 'has many movement categories' do
    association = described_class.reflect_on_association(:category_movements)
    expect(association.macro).to eq(:has_many)
  end

  it 'has many categories through movement categories' do
    association = described_class.reflect_on_association(:categories)
    expect(association.macro).to eq(:has_many)
  end
end
