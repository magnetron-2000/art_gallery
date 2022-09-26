require 'rails_helper'

RSpec.describe "ArtWorks", type: :request do
  describe "art_works controller methods" do
    let(:user) {create(:user)}
    let(:art_work) {create(:art_work, user_id: user.id)}
    let(:log_params) {{"nickname": user.nickname, "password": user.password}}
    let(:create_params) {{"art_work": {"title": 'hello', "attachment": File.new("#{Rails.root}/spec/support/image.jpg"), "resize_to_fit": [400, 400] }}}

    context "http status" do
      before do
        post "/sessions", params: log_params #TODO why it work without params
      end

      it "show" do
        get "/art_works/#{art_work.id}"
        expect(response).to have_http_status(200)
      end

      it "new" do
        get "/art_works/new"
        expect(response).to have_http_status(200)
      end

      it "create" do  #TODO wrong
        post "/art_works", params: create_params
        expect(response).to have_http_status(200)
      end

      it "edit" do
        get "/art_works/#{art_work.id}/edit"
        expect(response).to have_http_status(200)
      end

      it "update" do  #TODO wrong
        patch "/art_works/#{art_work.id}", params: create_params
        expect(response).to have_http_status(302)
      end

      it "delete" do
        delete "/art_works/#{art_work.id}"
        expect(response).to have_http_status(302)
      end
    end
  end
end
