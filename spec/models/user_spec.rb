require 'rails_helper'

RSpec.describe User, type: :model do

  before(:each) do 
    @user = FactoryBot.build(:user)    
  end

  it "has a valid factory" do
    expect(build(:user)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@user).to be_a(User)
    end
    
    describe "#email" do
      it {expect(@user).to validate_presence_of(:email)}
      it {expect(@user).to validate_uniqueness_of(:email).ignoring_case_sensitivity}
      it {is_expected.to allow_value("cyber_snow@hotmail.com").for(:email)}
      it {is_expected.to allow_value("a@b.com").for(:email)}

      it {is_expected.to_not allow_value("cyber_snowgmail.com").for(:email)}
      it {is_expected.to_not allow_value("cyber_sno@gmailcom").for(:email)}
      it {is_expected.to_not allow_value("cyber_snow@").for(:email)}
    end

    describe "#username" do
      it {expect(@user).to validate_presence_of(:user_name)}
      it {expect(@user).to validate_uniqueness_of(:user_name)}
      it {is_expected.to allow_value("Taraceboolba").for(:user_name)}
      it {is_expected.to allow_value("Oui").for(:user_name)}
      it {is_expected.to_not allow_value("").for(:user_name)}
    end

    

  end
end
