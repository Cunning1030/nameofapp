require 'rails_helper'

describe UsersController, type: :controller do

  # @user = FactoryBot.create(:user)

  let(:user) { User.create!(first_name: "Moopy", last_name: "Mooperson", email: "test@test.com", password: "testicle") }

  describe 'GET #show' do
    context 'when a user is logged in' do
      before do
        sign_in user
      end
      it 'loads correct user details' do
        get :show, params: { id: user.id }
        expect(assigns(:user)).to eq user
      end
    end

    context 'when a user is not logged in' do
      it 'redirects to login' do
         get :show, params: { id: user.id }
         expect(response).to redirect_to(root_path)
       end
    end
  end
end
