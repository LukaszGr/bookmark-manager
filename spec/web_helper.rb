def sign_up
  visit '/users/new'
  expect(page.status_code).to eq 200
  fill_in :email, with: 'booboo@shed.com'
  fill_in :password, with: 'randomthing'
  click_button 'Sign up'
end