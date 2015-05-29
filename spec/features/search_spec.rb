require 'spec_helper'

feature "Search" do
  let!(:receipt)  { create :receipt }
  let!(:category) { create :category }

  before do
    visit receipts_path
  end

  it "All users can search receipts in all receipts" do
    fill_in "search", with: "Sk"

    click_button I18n.t('search')

    expect(page).to have_content receipt.title
  end

  it "All users can search receipts in specific category" do
    receipt.categories << category

    click_link category.name

    fill_in "search", with: "karote"

    click_button I18n.t('search')

    expect(page).to have_content receipt.title
  end

  it "If search doesn't find any receipt it will show message" do
    click_link category.name

    fill_in "search", with: "karote"

    click_button I18n.t('search')

    expect(page).to have_content I18n.t('categories.show.no_receipts')
  end
end
