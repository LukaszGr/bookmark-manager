require 'spec_helper'

feature 'User sign in' do
  scenario 'a new user can sign up' do
    expect {sign_up}.to change(User, :count).by 1
    expect(page).to have_content 'Welcome, booboo@shed.com'
    expect(User.first.email).to eq 'booboo@shed.com'
  end
end