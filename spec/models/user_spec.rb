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

    describe "#description" do
      it {is_expected.to allow_value("Taraceboolba fewf ewfwerfer").for(:description)}
      it {is_expected.to allow_value("Oui").for(:description)}
    end


    describe "#is_admin" do
      it {is_expected.to allow_value(true).for(:is_admin)}
      it {is_expected.to allow_value(false).for(:is_admin)}
      it "should be false at user creation" do
        expect(@user.is_admin).to eq(false)
      end
    end

    describe "#is_online" do
      it {is_expected.to allow_value(true).for(:is_online)}
      it {is_expected.to allow_value(false).for(:is_online)}
      it "should be false at user creation" do
        expect(@user.is_online).to eq(nil)
      end
    end
  end

  context "public instance methods" do
    describe "online" do
      it { expect(@user).to respond_to(:online) }

      it "should return online_status" do
        user = FactoryBot.build(:user)
        user.online
        expect(user.is_online).to eq(true)
      end
    end

    describe "offline" do
      it { expect(@user).to respond_to(:offline) }

      it "should return offline_status" do
        user = FactoryBot.build(:user) 
        user.offline
        expect(user.is_online).to eq(false)
      end
    end

    describe "grab_image" do
      it { expect(@user).to respond_to(:grab_image) }

      it "should grab a picture" do
        user = FactoryBot.build(:user) 
        user.grab_image
        expect(user.avatar.attached?).to eq(true)
      end
    end

    describe "search" do
      it { expect(User).to respond_to(:search) }

      it "should return an user if search" do
        user = FactoryBot.create(:user, user_name:"felix-#{rand(3..100000)}") 

        expect(User.search('felix')).to include(user)
      end

      it "should return all users without search" do
        expect(User.search(nil)).to eq(User.all)
      end
    end

    describe "dont_already_like?(likeable)" do
      it { expect(@user).to respond_to(:dont_already_like?) }

      it "should return true if user already like a likeable" do
        user = FactoryBot.create(:user) 
        post = FactoryBot.create(:post) 
        like = FactoryBot.create(:like, user: user, likeable: post)

        expect(user.dont_already_like?(post)).to eq(false)
      end

      it "should return false if user dont already like a likeable" do
        user = FactoryBot.create(:user) 
        post2 = FactoryBot.create(:post) 

        expect(user.dont_already_like?(post2)).to eq(true)
      end
    end
  end

  context "associations" do
    it { expect(@user).to have_many(:user_categories)}
    it { expect(@user).to have_many(:categories)}
    it { expect(@user).to have_many(:posts)}
    it { expect(@user).to have_many(:comments)}
    it { expect(@user).to have_many(:likes)}
    it { expect(@user).to have_many(:messages)}
    it { expect(@user).to have_many(:conversations)}
  end
end