# frozen_string_literal: true
require 'rails_helper'

RSpec.describe User, type: :model do

	before(:each) do 
		@user = User.create(username: "johndoe", email: "test@yopmail.com", password: "testceciestuntest")
	end

	context "validation" do

		it "is valid with valid attributes" do
			expect(@user).to be_a(User)
			expect(@user).to be_valid
		end

    describe "#username" do
    	it "should not be lower that 3 characters" do
    		invalid_user = User.create(username: "aa")
    		expect(invalid_user).not_to be_valid
    		expect(invalid_user.errors.include?(:username)).to eq(true)
    	end
    end

    describe "#username" do
    	it "should not be lower that 3 characters" do
    		invalid_user = User.create(username: "aa")
    		expect(invalid_user).not_to be_valid
    		expect(invalid_user.errors.include?(:username)).to eq(true)
    	end
    end

    describe "#username" do
    	it "should not be lower that 3 characters" do
    		invalid_user = User.create(username: "aa")
    		expect(invalid_user).not_to be_valid
    		expect(invalid_user.errors.include?(:username)).to eq(true)
    	end
    end

  end

  context "associations" do

  	describe "books" do
  		it "should have_many books" do
  			book = Book.create(user: @user)
  			expect(@user.books.include?(book)).to eq(true)
  		end
  	end

  end



  context "public instance methods" do

  	describe "#full_name" do

  		it "should return a string" do
  			expect(@user.full_name).to be_a(String)
  		end

  		it "should return the full name" do
  			user_1 = User.create(first_name: "John", last_name: "Doe", username: "johndoe")
  			expect(user_1.full_name).to eq("John Doe")
  			user_2 = User.create(first_name: "Jean-Michel", last_name: "Durant", username: "kikou_du_75")
  			expect(user_2.full_name).to eq("Jean-Michel Durant")
  		end
  	end

  end

end

