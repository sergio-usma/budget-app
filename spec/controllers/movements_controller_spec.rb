require 'rails_helper'

RSpec.describe MovementsController, type: :controller do
  let(:user) { create(:user) }
  let(:category) { create(:category, user:) }
  let(:valid_attributes) { attributes_for(:movement, category_ids: [category.id]) }
  let(:invalid_attributes) { attributes_for(:movement, amount: nil) }

  before do
    sign_in user
  end

  describe 'GET #index' do
    it 'renders the index template' do
      get :index, params: { category_id: category.id }
      expect(response).to render_template(:index)
    end

    it 'assigns @movements and @total_amount' do
      movement = create(:movement, category_ids: [category.id], author: user)
      get :index, params: { category_id: category.id }
      expect(assigns(:movements)).to eq([movement])
      expect(assigns(:total_amount)).to eq(movement.amount)
    end
  end

  describe 'GET #new' do
    it 'renders the new template' do
      get :new, params: { category_id: category.id }
      expect(response).to render_template(:new)
    end

    it 'assigns @movement and @categories' do
      get :new, params: { category_id: category.id }
      expect(assigns(:movement)).to be_a_new(Movement)
      expect(assigns(:categories)).to eq([category])
    end

    context 'with invalid attributes' do
      it 'does not save the new payment' do
        expect do
          post :create, params: { category_id: category.id, movement: invalid_attributes }
        end.to_not change(Movement, :count)
      end

      it 're-renders the new template' do
        post :create, params: { category_id: category.id, movement: invalid_attributes }
        expect(response).to render_template(:new)
      end
    end
  end
end
