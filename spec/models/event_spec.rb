require 'rails_helper'

RSpec.describe Event, type: :model do

	before(:each) do 
		@user = FactoryBot.build(:event)    
	end

	it "has a valid factory" do
		expect(build(:event)).to be_valid
	end
	
	# describe "#title" do
	# 	it {expect(@event).to validate_presence_of(:title)}
	# 	it {is_expected.to allow_value("This is a title").for(:title)}
	# 	it {is_expected.to allow_value("this title").for(:title)}
	# 	it {is_expected.to allow_value("This is also a title, but longer").for(:title)}
	# end

	# describe "#start_date" do
	# 	it {expect(@event).to validate_presence_of(:start_date)}
	# 	it {is_expected.to allow_value("2019-03-18 11:08:23").for(:start_date)}
	# 	it {is_expected.to allow_value("2020-10-19 20:00:00").for(:start_date)}
	# 	it {is_expected}.to_not allow_value("2019-01-17 00:00:00").for(:start_date)
	# 	it {is_expected}.to_not allow_value("2018-01-17 00:00:00").for(:start_date)
	# end

	# describe "#end_date" do
	# 	it {expect(@event).to validate_presence_of(:end_date)}
	# 	it {is_expected.to allow_value(:end_date > :start_date).for(:end_date)}
	# 	it {is_expected.to_not allow_value(:end_date < :start_date).for(:end_date)}
	# end
end