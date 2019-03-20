require 'rails_helper'

RSpec.describe Category, type: :model do

	before(:each) do 
		@category = FactoryBot.build(:category)    
	end


	it "has a valid factory" do
		expect(build(:category)).to be_valid
	end

	context "validation" do
		it "is valid with valid attributes" do
			expect(@category).to be_a(Category)
		end
		describe "#name" do
			it {expect(@category).to validate_presence_of(:name)}
			it {is_expected.to allow_value("Permaculture").for(:name)}
			it {is_expected.to allow_value("Agroforesterie").for(:name)}
			it {is_expected.to_not allow_value("").for(:name)}
		end
	end
end