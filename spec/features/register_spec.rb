require 'spec_helper'

feature "Register" do
  before do
    visit new_user_registration_path
  end

  it "User successfully registers" do
    fill_in 'user_email', with: "epasts@epasts.com"
    fill_in 'user_username', with: "lietotajs1"
    fill_in 'user_password', with: "neteiksu"

    click_button I18n.t('register')

    expect(page).to have_content "lietotajs1"
  end

  it "User does not fill all required fields" do
    fill_in 'user_email', with: "epasts2@epasts2.com"
    fill_in 'user_username', with: "lietotajs2"

    click_button I18n.t('register')

    expect(page).to have_content I18n.t('error')
  end
end
