require 'rails_helper'

RSpec.describe Article, type: :model do

  before(:each) do
    @article = FactoryBot.build(:article)
  end

  it "has a valid factory" do
    expect(build(:article)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@article).to be_a(Article)
    end

    describe "#title" do
      it {expect(@article).to validate_presence_of(:title)}
      it {expect(@article).to validate_uniqueness_of(:title)}
      it {is_expected.to allow_value("Super article sur l'agroforesterie").for(:title)}
      it {is_expected.to_not allow_value("Sup").for(:title)}
      it {is_expected.to_not allow_value("a" *61).for(:title)}
    end

    describe "#content" do
      it {expect(@article).to validate_presence_of(:content)}
      it {is_expected.to allow_value("Super article sur l'agroforesterie").for(:content)}
      it {is_expected.to_not allow_value("Sup").for(:content)}
    end
  end
end
