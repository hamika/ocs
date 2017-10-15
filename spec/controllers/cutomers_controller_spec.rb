require 'rails_helper'

describe CustomersController do
  let(:user) { create(:user) }
  before { login_user user }
  describe 'GET#index' do
    it "customers#indexを表示すること" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET#show' do
    let(:customer) { create(:customer) }
    before { get :show, params: { id: customer }, session: {} }

    it "@customerに要求された:customerを割り当てること" do
      expect(assigns(:customer)).to eq customer
    end

    it "customers#showを表示すること" do
      expect(response).to render_template :show
    end
  end

  describe 'GET#new' do
    let(:customer) { create(:customer) }
    before { get :new, params: { id: customer }, session: {} }

    it "@customerに新規:customerを割り当てること" do
      expect(assigns(:customer)).to be_a_new(Customer)
    end

    it "customers#newを表示すること" do
      expect(response).to render_template :new
    end
  end

  describe 'GET#edit' do
    let(:customer) { create(:customer) }
    before { get :edit, params: { id: customer }, session: {} }

    it "@customerに要求された:customerを割り当てること" do
      expect(assigns(:customer)).to eq customer
    end

    it "customers#editを表示すること" do
      expect(response).to render_template :edit
    end
  end

  describe "POST#create" do
    let(:customer_attributes) { attributes_for(:customer) }
    let(:invalid_customer_attributes) { attributes_for(:invalid_customer) }
    context "有効な属性の場合" do
      it "DBに新しい:customerを保存すること" do
        expect do
          post :create,
          params: { customer: customer_attributes },
          session: {}
        end.to change(Customer, :count).by(1)
      end

      it "customers#showにリダイレクトすること" do
        post :create,
        params: { customer: customer_attributes },
        session: {}
        expect(response).to redirect_to customer_path(assigns[:customer])
      end
    end

    context "無効な属性の場合" do
      it "DBに新しい:customerを保存しないこと" do
        expect do
          post :create,
          params: { customer: invalid_customer_attributes }
        end.not_to change(Customer, :count)
      end

      it "#newを再表示すること" do
        post :create,
        params: { customer: invalid_customer_attributes }
        expect(response).to render_template :new
      end
    end
  end

  describe 'PATCH#update' do
    let(:customer_attributes) { attributes_for(:customer) }
    let(:invalid_customer_attributes) { attributes_for(:invalid_customer) }
    before :each do
      @customer = create(:customer,
        first_name: '明日奈',
        last_name: '結城',
        address: '東京',
        phone: '08012345678',
        email: 'asuna@example.com',
        birthday: 20070930,
        gender: 'female'
      )
    end

    context "有効な属性の場合" do
      it "要求された@customerを取得すること" do
        patch :update,
        params: { id: @customer, customer: customer_attributes }
        expect(assigns(:customer)).to eq(@customer)
      end

      it "@customerの属性を変更すること" do
        patch :update,
        params: { id: @customer,
          customer: attributes_for(
            :customer, first_name: 'Larry', last_name: 'Smith'
          )
        }
        @customer.reload
        expect(@customer.first_name).to eq('Larry')
        expect(@customer.last_name).to eq('Smith')
      end

      it "更新した:customerのページへリダイレクトすること" do
        patch :update,
        params: { id: @customer, customer: customer_attributes }
        expect(response).to redirect_to @customer
      end
    end

    context "無効な属性の場合" do
      it ":customerの属性を変更しないこと" do
        patch :update,
        params: { id: @customer,
          customer: attributes_for(
            :customer, first_name: 'Larry', last_name: nil
          )
        }
        @customer.reload
        expect(@customer.first_name).not_to eq('Larry')
        expect(@customer.last_name).to eq('結城')
      end

      it "#editを再表示すること" do
        patch :update,
        params: { id: @customer, customer: invalid_customer_attributes }
        expect(response).to render_template :edit
      end
    end
  end

  describe 'DELETE#destroy' do
    let!(:customer) { create(:customer) }

    it ':customerを削除すること' do
      expect do
        delete :destroy, params: { id: customer }, session: {}
      end.to change(Customer, :count).by(-1)
    end

    it 'customers#indexにリダイレクトすること' do
      delete :destroy, params: { id: customer }, session: {}
      expect(response).to redirect_to customers_url
    end
  end
end
