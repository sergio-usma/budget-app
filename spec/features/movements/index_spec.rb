require 'rails_helper'

describe "Visit the index page of 'movements'", type: :feature do
  # Logged in user and categories
  before do
    user = FactoryBot.create(:user)
    login_as(user)

    @category = FactoryBot.create(:category, user:)
    @payments = FactoryBot.create_list(:movement, 5, author: user)
    @category.movements << @payments

    visit category_movements_path(@category)
  end

  it ' should display the title of the page' do
    expect(page).to have_content 'MOVEMENTS'
  end

  it " should display the 'New Movement' button" do
    expect(page).to have_selector('.btn-green', text: 'Add a New Transaction')
  end

  it ' should redirect to new payment page when clicking on Add a New Transaction button' do
    click_link 'Add a New Transaction'
    expect(page).to have_current_path(new_category_movement_path(@category))
  end
end
