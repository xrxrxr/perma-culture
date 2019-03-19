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
      user = FactoryBot.create(:user) 
      visit new_user_session_path
      fill_in :user_email, with: user.email
      fill_in :user_password, with: user.password
      click_button 'Se connecter'
  end
end