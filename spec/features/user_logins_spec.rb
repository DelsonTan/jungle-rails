require 'rails_helper'

RSpec.feature "UserLogins", type: :feature, js: true do
  before :each do
    @user = User.create!(
      first_name: 'test',
      last_name: 'user',
      email: 'test@user.com',
      password: "testtest",
      password_confirmation: "testtest"
    )
  end

  scenario "A user visits the login page to login" do
  
    # ACT
    visit login_path

    within 'form' do
      fill_in id: 'email', with: @user.email
      fill_in id: 'password', with: @user.password

      click_button 'Login'
    end
    # DEBUG / VERIFY
    sleep 2
    save_screenshot

    expect(page).to have_content @user.email

  end
end
