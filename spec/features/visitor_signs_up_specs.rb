require 'rails_helper'

feature 'Visitor signs up' do
  scenario 'with valid email and password' do
    sign_up_with 'Deoladed', 'valid@example.com', '$taawktljasktlw4aagl'

    expect(page).to have_content('Publier')
  end

  scenario 'with invalid email' do
    sign_up_with 'PSeudooucsacais', 'invalid_email', '$taawktljasktlw4aagl'

    expect(page).to have_content('Inscription')
  end

  scenario 'with blank password' do
    sign_up_with 'PSeudoouaidqdqs', 'valid2@example.com', ''

    expect(page).to have_content('Inscription')
  end

  scenario 'with blank pseudo' do
    sign_up_with '', 'valid@example.com', '$taawktljasktlw4aagl'

    expect(page).to have_content('Inscription')
  end

    def sign_up_with(pseudo, email, password)
      visit new_user_registration_path
      fill_in :user_user_name, with: pseudo
      fill_in :user_email, with: email
      fill_in :user_password, with: password
      fill_in :user_password_confirmation, with: password

      click_button 'Créer un compte'
    end
end