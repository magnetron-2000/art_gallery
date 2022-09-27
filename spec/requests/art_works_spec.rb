require 'rails_helper'

RSpec.describe "ArtWorks", type: :request do
  describe "art_works controller methods" do
    let(:user) {create(:user)}
    let(:art_work) {create(:art_work, user_id: user.id)}
    let(:log_params) {{"nickname": user.nickname, "password": user.password}}
    let(:file) { fixture_file_upload(file_fixture('image.jpg')) }
    let(:create_params) {{"art_work": {"title": 'hello', "attachment": file, "resize_to_fit": [400, 400] }}}

    context "http status" do
      before do
        post "/sessions", params: log_params
      end

      it "show" do
        get "/art_works/#{art_work.id}"
        expect(response).to have_http_status(200)
      end

      it "new" do
        get "/art_works/new"
        expect(response).to have_http_status(200)
      end

      it "create" do
        post "/art_works", params: create_params
        expect(response).to have_http_status(302)
      end

      it "edit" do
        get "/art_works/#{art_work.id}/edit"
        expect(response).to have_http_status(200)
      end

      it "update" do  #TODO something wrong
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
