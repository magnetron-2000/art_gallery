require 'rails_helper'

RSpec.describe '/users routes' do
  describe "#route" do

    it "to users#create" do
      expect(post '/users').to route_to("users#create")
    end

    it "to users#new" do
      expect(get '/users/new').to route_to("users#new")
    end

    it "to users#index" do
      expect(get '/users').to route_to("users#index")
    end
  end
end