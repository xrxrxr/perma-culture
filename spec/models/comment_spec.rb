require 'rails_helper'

RSpec.describe Comment, type: :model do

	before(:each) do
		@comment = FactoryBot.build(:comment)
	end

	it "has a valid factory" do
		expect(build(:comment)).to be_valid
	end

	context "validation" do
		it "is valid with valid attributes" do
			expect(@comment).to be_a(Comment)
		end

		describe "#content" do
			it {expect(@comment).to validate_presence_of(:content)}
			it {is_expected.to allow_value("This is some quality content. ").for(:content)}
			it {is_expected.to allow_value("a" * 1000).for(:content)}
			it {is_expected.to_not allow_value("N").for(:content)}
			it {is_expected.to_not allow_value("b" * 1001).for(:content)}
		end
	end

	context "public instance methods" do

		describe "readable_date" do
			it { expect(@comment).to respond_to(:readable_date) }

			it "should a readable date" do
				comment = FactoryBot.create(:comment)

				expect(comment.readable_date).to eq(comment.created_at.strftime("%d/%m/%y à %H:%M"))
			end
		end
	end

	context "associations" do
		it { expect(@comment).to have_many(:likes) }
		it { expect(@comment).to have_many(:comments) }
		it { expect(@comment).to belong_to(:user) }
		it { expect(@comment).to belong_to(:commenteable) }
	end
end
