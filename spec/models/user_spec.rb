require 'rails_helper'

RSpec.describe User, type: :model do
  describe "validates" do
    let(:user) {create(:user)}
    let(:art_work) {create(:art_work, user_id: user.id)}

    it "columns should be" do
      expect(user.nickname).to be_present
      expect(user.email).to be_present
      expect(user.password).to be_present
      expect(user).to be_valid
    end

    it 'nickname should be no valid' do
      user.nickname = 's'
      expect(user).not_to be_valid
    end

    it 'email should be no valid' do
      user.email = 's'
      expect(user).not_to be_valid
    end
  end
end
