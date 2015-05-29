require 'spec_helper'

feature "Authentification" do
  let!(:user) { create :user }

  it "User successfully logs in" do
    visit new_user_session_path

    fill_in 'user_email', :with => 'epasts@epasts.com'
    fill_in 'user_password', :with => 'parole12'

    click_button I18n.t('signin')

    expect(page).to have_content user.username
  end

  it "User enters incorrect email or password" do
    visit new_user_session_path

    fill_in 'user_email', :with => 'epasts2@epasts2.com'
    fill_in 'user_password', :with => 'parole12'

    click_button I18n.t('signin')

    expect(page).to have_content I18n.t('devise.failure.invalid')
  end

  it "User does not fill all required fields" do
    visit new_user_session_path

    fill_in 'user_email', :with => 'epasts2@epasts2.com'

    click_button I18n.t('signin')

    expect(page).to have_content I18n.t('devise.failure.not_found_in_database')
    expect(page).to_not have_content I18n.t('exit')
  end

  it "User can edit his profile(change email and/or password)" do
    login_as(user)

    visit home_index_path

    click_link user.username

    fill_in 'user_email', with: "jaunsepasts@epasts.com"
    fill_in 'user_password', with: "jaunaparole"
    fill_in 'user_password_confirmation', with: "jaunaparole"
    fill_in 'user_current_password', with: "parole12"

    click_button I18n.t('save')

    expect(page).to have_content I18n.t('devise.registrations.user.updated')
    expect(User.last.email).to eq "jaunsepasts@epasts.com"
  end

  it "User successfully signs out" do
    login_as(user)

    visit home_index_path

    click_link I18n.t('exit')

    expect(page).to_not have_content user.username
    expect(page).to have_content I18n.t('signin')
  end
end
