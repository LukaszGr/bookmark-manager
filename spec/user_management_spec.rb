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
    expect(page).to have_content "Password does not match the confirmation"
  end

  scenario 'I can\'t sign up without inputing email' do
    expect { sign_up(email: nil) }.not_to change(User, :count)
  end

  scenario 'Cannot sign up with invalid e-mail' do
    expect { sign_up(email: "invalid@email")}.not_to change(User, :count)
  end

  scenario 'user cannot sign with existing email' do
    sign_up
    expect { sign_up }.to_not change(User, :count)
    expect(page).to have_content "Email is already taken"
  end
end




