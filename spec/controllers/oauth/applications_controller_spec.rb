require 'rails_helper'

RSpec.describe Oauth::ApplicationsController, type: :controller do
  let(:user) { User.create!(email: 'test@fun.ac.jp', password: 'password', confirmed_at: DateTime.now) }
  let(:other_user) { User.create!(email: 'test2@fun.ac.jp', password: 'password', confirmed_at: DateTime.now) }

  describe "GET #index" do
    before do
      sign_in user
    end

    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end

    it "has own applications, not others" do
      Doorkeeper::Application.create!(owner: user, name: 'test_app', redirect_uri: 'https://example.com', scopes: '', confidential: true)
      Doorkeeper::Application.create!(owner: other_user, name: 'test_otherapp', redirect_uri: 'https://example.com', scopes: '', confidential: true)
      get :index
      expect(assigns(:applications).length).to eq 1
    end
  end
end
