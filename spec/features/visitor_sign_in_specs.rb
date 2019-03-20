require 'rails_helper'


describe "the signin process", type: :feature do
  before :each do
    sign_in
  end

  it "signs me in" do
    expect(page).to have_content 'Connecté'
    expect(page).to have_content 'Publier'
  end

  def sign_in 
  end
end