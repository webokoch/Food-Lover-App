require 'rails_helper'

RSpec.describe FoodsController, type: :controller do
  # binding.pry

  let(:valid_attributes) do
    {
      name: 'Sushi',
      cuisine: 'Japanese',
      description: 'Fish & Rice',
      user: User.first
    }

  end

  describe "GET #index" do
    it "returns a success response" do
      Food.create! valid_attributes
      get :index
      expect(assigns(:foods)).to eq(Food.all)
    end
  end
end
    
  #   context 'with user signed in' do
  #     it 'requests foods#index' do
  #       get :index
  #       expect(assigns(:foods)).to eq(Food.all)
  #     end
      
  #     it 'renders index template' do
  #       get restaurants_path
  #       expect(response).to render_template(:index)
  #     end
  #   end

  #   context 'with no signed in' do
  #     it 'requests foods#index' do
  #       expect(assigns(:foods)).to eq(Food.all)
  #     end
      
  #     it 'renders index template' do
  #       expect(response).to render_template(:index)
  #     end
  #   end
  # end
