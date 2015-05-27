require 'spec_helper'

feature "Language" do
  it "User successfully changes language" do
    visit receipts_path

    expect(page).to have_content I18n.t('layouts.home.home')
    expect(page).to have_content "Sākums"

    click_link "English"

    expect(page).to have_content I18n.t('layouts.home.home')
    expect(page).to have_content "Home"
  end
end
