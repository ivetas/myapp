require 'spec_helper'

feature "Language" do
  it "User successfully changes language" do
    visit receipts_path

    expect(page).to have_content I18n.t('layouts.home.home')
    expect(page).to have_content "Sākums"

    page.find(:xpath, "//a[@href='/receipts?locale=en']").click

    expect(page).to have_content I18n.t('layouts.home.home')
    expect(page).to have_content "Home"
  end
end
