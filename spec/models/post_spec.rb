require 'rails_helper'

RSpec.describe Post, type: :model do

	before(:each) do 
		@post = FactoryBot.create(:post)    
	end

	it "has a valid factory" do
		expect(build(:post)).to be_valid
	end

	context "validation" do
		it "is valid with valid attributes" do
			expect(@post).to be_a(Post)
		end
		describe "#title" do
			it {expect(@post).to validate_presence_of(:title)}
			it {is_expected.to allow_value("This is a test for a title").for(:title)}
			it {is_expected.to allow_value("This is also a test for another title").for(:title)}
			it {is_expected.to_not allow_value("Test").for(:title)}
			it {is_expected.to_not allow_value("Tes" * 60).for(:title)}
		end

		describe "#content" do
			it {expect(@post).to validate_presence_of(:content)}
			it {is_expected.to allow_value("This is some quality content. ").for(:content)}
			it {is_expected.to allow_value("This is some quality content. " * 100).for(:content)}
			it {is_expected.to_not allow_value("Nope" ).for(:content)}
			it {is_expected.to_not allow_value("This won't be ok... " * 3000).for(:content)}
		end

		context "associations" do
			it { expect(@post).to have_many(:comments)}
			it { expect(@post).to have_many(:likes)}
			it { expect(@post).to belong_to(:writter).class_name('User')}
			it { expect(@post).to belong_to(:category)}
		end
	end
end