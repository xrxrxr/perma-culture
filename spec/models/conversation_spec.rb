require 'rails_helper'

RSpec.describe Conversation, type: :model do

	before(:each) do
		@conversation = FactoryBot.build(:conversation)
	end

	it "has a valid factory" do
		expect(build(:conversation)).to be_valid
	end

	context "validation" do
		it "is valid with valid attributes" do
			expect(@conversation).to be_a(Conversation)
		end
	end

	context "public instance methods" do

		describe "self.get(sender_id, recipient_id)" do
			it { expect(Conversation).to respond_to(:get) }

			it "return a conversation if present" do
				user1 = FactoryBot.build(:user)
				user2 = FactoryBot.build(:user)
				conversation = FactoryBot.create(:conversation, sender: user1, recipient: user2)

				expect(Conversation.get(user1.id, user2.id)).to eq(conversation)
			end

			it "create a conversation if not present" do
				user1 = FactoryBot.create(:user)
				user2 = FactoryBot.create(:user)
				user3 = FactoryBot.create(:user)
				conversation = FactoryBot.create(:conversation, sender: user1, recipient: user2)

				expect(Conversation.get(user1.id, user3.id)).to eq(Conversation.find_by(sender: user1, recipient: user3))
			end
		end

		describe "opposed_user" do
			it { expect(@conversation).to respond_to(:opposed_user) }

			it "opposed conversation user" do
				user1 = FactoryBot.build(:user)
				user2 = FactoryBot.build(:user)
				conversation = FactoryBot.create(:conversation, sender: user1, recipient: user2)
				message = FactoryBot.build(:message, conversation: conversation, user: user1)

				expect(message.conversation.opposed_user(user1)).to eq(user2)
			end
		end
	end

	context "associations" do
		it { expect(@conversation).to have_many(:messages) }
		it { expect(@conversation).to belong_to(:sender).class_name('User') }
		it { expect(@conversation).to belong_to(:recipient).class_name('User') }
	end
end
