require 'rails_helper'

RSpec.describe Message, type: :model do
	before(:each) do
		@message = FactoryBot.build(:message)
	end

	it "has a valid factory" do
		expect(build(:message)).to be_valid
	end

	context "validation" do
		it "is valid with valid attributes" do
			expect(@message).to be_a(Message)
		end

		describe "#body" do
			it {expect(@message).to validate_presence_of(:body)}
		end
	end

  context "associations" do
    it { expect(@message).to belong_to(:user)}
    it { expect(@message).to belong_to(:conversation)}
  end
end
