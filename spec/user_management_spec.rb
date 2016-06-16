require 'spec_helper'

feature 'User sign in' do
  scenario 'a new user can sign up' do
    expect {sign_up}.to change(User, :count).by 1
    expect(page).to have_content 'Welcome, booboo@shed.com'
    expect(User.first.email).to eq 'booboo@shed.com'
  end

  scenario 'requires a matching confirmation password' do
    expect{ sign_up(password_confirmation: 'wrong') }.not_to change(User, :count)
    expect(current_path).to eq('/users')
    expect(page).to have_content "Password and confirmation do not match!"
  end
end


