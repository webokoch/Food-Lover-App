require 'rails_helper'

RSpec.describe "Foods", type: :controller do
  login_user
  
  describe 'GET /index' do
    before { get restaurants_path }

    context 'with user signed in' do
      it 'requests foods#index' do
        expect(assigns(:foods)).to eq(Food.all)
      end
      
      it 'renders index template' do
        expect(response).to render_template(:index)
      end
    end

    context 'with no signed in' do
      it 'requests foods#index' do
        expect(assigns(:foods)).to eq(Food.all)
      end
      
      it 'renders index template' do
        expect(response).to render_template(:index)
      end
    end
  end
end
