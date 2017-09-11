require 'rails_helper'

RSpec.describe WikisController, type: :controller do
  
  let(:my_wiki) { create(:wiki) }
  
  describe "GET #index" do
    before { get :index }
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
    
    it "assigns @wikis" do
      expect(assigns(:wikis)).to eq([my_wiki])
    end
    
    it "renders the index template" do
      expect(response).to render_template :index
    end
  end

  describe "GET #show" do
    it "returns http success" do
      get :show
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #edit" do
    it "returns http success" do
      get :edit
      expect(response).to have_http_status(:success)
    end
  end

end
