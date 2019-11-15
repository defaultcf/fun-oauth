require 'rails_helper'

RSpec.describe Api::V1::CredentialsController, type: :controller do
  let(:user) { User.create!(email: 'test@fun.ac.jp', password: 'password', confirmed_at: DateTime.now) }

  describe "GET #me" do
    before do
      sign_in user
    end

    it "returns http success" do
      get :me
      expect(response).to have_http_status(:success)
    end
  end

end
