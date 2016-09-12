require 'spec_helper'
require 'rails_helper'


describe User do

  subject(:user) do
    FactoryGirl.create(:user)
  end

  it { should validate_presence_of(:username) }
  it { should validate_presence_of(:password_digest) }
  it { should validate_presence_of(:session_token) }
  it { should validate_length_of(:password).is_at_least(6) }

  it "encrypts the password" do
    expect(user.password_digest).to_not be_nil
  end

  it "ensures session token" do
    expect(user.session_token).to_not be_nil
  end




  describe "#reset_session_token!" do
    it "sets a new session token" do
      old_session_token = user.session_token
      user.reset_session_token!
      expect(old_session_token).to_not eq(user.session_token)
    end

    it "returns the new session token" do
      expect(user.reset_session_token!).to eq(user.session_token)
    end
  end

  describe "#is_password?" do
    it "checks that password is valid" do
      expect(user.is_password?("Sennacy")).to be true
      expect(user.is_password?("bad")).to be false
    end
  end


  describe ".find_by_credentials" do
    before { user.save! }

    it "finds the correct user" do
      expect(User.find_by_credentials("tommy", "Sennacy")).to eq(user)
      expect(User.find_by_credentials("tommy", "bad")).to_not eq(user)
    end
  end

end
