# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Like, type: :model do

	before(:each) do
		@like = FactoryBot.build(:like)
	end

	it "has a valid factory" do
		expect(build(:like)).to be_valid
	end

	context "validation" do
		it "is valid with valid attributes" do
			expect(@like).to be_a(Like)
		end
	end

	context "associations" do
		it { expect(@like).to belong_to(:user) }
		it { expect(@like).to belong_to(:likeable) }
	end
end

