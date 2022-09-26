require 'rails_helper'

RSpec.describe '/art_works routes' do
  describe "#route" do
    let(:user) {create(:user)}
    let(:art_work) {create(:art_work, user_id: user.id)}

    it "to art_works#create" do
      expect(post '/art_works').to route_to("art_works#create")
    end

    it "to art_works#new" do
      expect(get '/art_works/new').to route_to("art_works#new")
    end

    it "to art_works#edit" do
      expect(get "/art_works/#{art_work.id}/edit").to route_to(controller: 'art_works', action: 'edit', id: "1")
    end

    it "to art_works#show" do
      expect(get "art_works/#{art_work.id}").to route_to(controller: 'art_works', action: 'show', id: "1")
    end

    it "to art_works#update" do
      expect(patch "art_works/#{art_work.id}").to route_to(controller: 'art_works', action: 'update', id: "1")
      expect(put "art_works/#{art_work.id}").to route_to(controller: 'art_works', action: 'update', id: "1")
    end

    it "to art_works#delete" do
      expect(delete "art_works/#{art_work.id}").to route_to(controller: 'art_works', action: 'destroy', id: "1")
    end
  end
end