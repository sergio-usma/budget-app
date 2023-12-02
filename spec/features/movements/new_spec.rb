require 'rails_helper'

describe 'Visit the new movements page', type: :feature do
  # Logged in user and category
  before do
    user = FactoryBot.create(:user)
    login_as(user)
    @category = FactoryBot.create(:category, user:)
    @categories = [@category] # For the select dropdown options
    @movement = FactoryBot.build(:movement) # A new movement object to populate the form
    visit new_category_movement_path(@category)
  end

  it '2 should display the movement form' do
    expect(page).to have_selector('form')
  end

  it '3 should display form fields' do
    expect(page).to have_field('Amount', type: 'text')
    expect(page).to have_field('Movement Name', type: 'text')
  end

  it '4 should display validation errors' do
    click_button 'Create Movement' # Assuming the button text is 'Create Movement'
    expect(page).to have_content("Amount can't be blank")
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Category ids can't be blank")
  end
end
