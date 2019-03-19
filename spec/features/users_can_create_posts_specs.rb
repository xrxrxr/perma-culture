require 'rails_helper'


describe "the post process", type: :feature do
  before :each do
    sign_in
  end

  it "can open the post form" do
    visit posts_path
    fill_in :post_title, with: "La perma c'est fantastique"
    fill_in :post_content, with: "JIDjewodneodinweipb hfewiuf hewiuf weuf hwe"
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