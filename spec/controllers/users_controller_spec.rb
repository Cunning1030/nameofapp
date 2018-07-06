require 'rails_helper'

describe UsersController, type: :controller do

  #let(:user) { User.create!(first_name: "Moopy", last_name: "Mooperson", email: "test@test.com", password: "testify") }
  let(:user) { FactoryBot.create(:user) }

  describe 'GET #index' do

    context 'when a user is logged in' do

      before do
        sign_in user
      end

      it "can view user index" do
        get :index
        expect(response).to be_ok
        expect(response).to render_template('index')
      end

    end

    context 'when a user is not logged in' do

      it "cannot view user index" do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end

    end

  end

  describe 'GET #show' do

    context 'when a user is logged in' do

      before do
        sign_in user
      end

      it "loads correct user details" do
        get :show, params: { id: user.id }
        expect(assigns(:user)).to eq user
        expect(response).to be_ok
      end

    end

    context 'when a user is not logged in' do

      it "redirects to login" do
        get :show, params: { id: user.id }
        expect(response).to redirect_to(root_path)
      end

    end

  end

  describe 'GET #edit' do  # under construction

    context 'when user is logged in' do

      before do
        sign_in user
      end

      it "can edit own user info" do
        get :edit, params: { id: user.id }
        expect(assigns(:user)).to eq user
        expect(response).to be_ok
      end

      #it "cannot edit other user\'s info" do
        #get :edit, params: { id: user.id }
        #expect(response).to redirect_to(root_path)
      #end

    end

    #context 'when user is not logged in' do

      #it "cannot edit any user info" do
        #get :edit, params: { id: user.id }
        #expect(response).to redirect_to(root_path)
      #end

    #end

  end

  describe 'DELETE #destroy' do

    context 'When deleting your account' do

      before do
        sign_in user
      end

      it "deletes the user" do
        expect { delete :destroy, params: { id: user.id } }.to change(User, :count).by(-1)
      end

    end

  end

end
