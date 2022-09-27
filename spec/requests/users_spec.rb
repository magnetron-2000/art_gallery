require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "new" do
    it "returns http success" do
      get "/sign_up"
      expect(response).to have_http_status(:success)
    end
  end
end
