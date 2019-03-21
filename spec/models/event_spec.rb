require 'rails_helper'

RSpec.describe Event, type: :model do

	before(:each) do
		@event = FactoryBot.build(:event)
	end

	it "has a valid factory" do
		expect(build(:event)).to be_valid
	end

	context "validation" do
		it "is valid with valid attributes" do
			expect(@event).to be_a(Event)
		end

		it 'is geocoded by address' do
			@event = FactoryBot.create(:event, address: '41 Rue des Tables Claudiennes, 69001 Lyon, France')

        	expect(@event.longitude).to eq(4.8331662)
        	expect(@event.latitude).to eq(45.7709743)
      	end
	end
end
