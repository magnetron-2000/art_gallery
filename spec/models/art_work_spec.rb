require 'rails_helper'

RSpec.describe ArtWork, type: :model do
  describe "validates" do
    let(:user) {create(:user)}
    let(:art_work) {create(:art_work, user_id: user.id)}

    it "columns should be" do
      expect(art_work.user_id).to eq(user.id)
      expect(art_work.title).to be_present
      expect(art_work.attachment).to be_present
    end
  end
end
