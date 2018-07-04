require 'rails_helper'

describe OrdersController, type: :controller do

  before do
    @order = FactoryBot.create(:order)
    sign_in @order.user
  end


  describe 'GET #index' do

    context 'when orders created' do

      it "loads products list in index template" do
        get :index
        expect(response).to be_ok
        expect(response).to render_template('index')
      end

    end

  end

  #describe 'GET #show' do  # ability to create orders construction

    #context 'when a order is created' do

      #it "loads order details in show template" do
        #get :show, params: { id: @order.id}
        #expect(response).to be_ok
        #expect(response).to render_template('show')
      #end

    #end

  #end

end
