require 'rails_helper'


describe "the signin process", type: :feature do

  it "signs me in" do
  	user = FactoryBot.create(:user) 
  	visit new_user_session_path
  	fill_in :user_email, with: user.email
  	fill_in :user_password, with: user.password
  	click_button 'Se connecter'

    expect(page).to have_content 'Connecté'
    expect(page).to have_content 'Publier'
  end
end