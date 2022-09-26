require 'rails_helper'

RSpec.describe '/sessions routes' do
  describe "#route" do
    let(:user) {create(:user)}

    it "to sessions#create" do
      expect(post '/sessions').to route_to("sessions#create")
    end

    it "to sessions#new" do
      expect(get '/sessions/new').to route_to("sessions#new")
    end

    it "to sessions#delete" do
      post "/sessions"
      expect(delete "sessions/1").to route_to(controller: 'sessions', action: 'destroy', id: "1")
    end
  end
end