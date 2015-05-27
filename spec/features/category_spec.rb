require 'spec_helper'

feature "Category" do
  let!(:user)      { create :user }
  let!(:category)  { create :category }
  let!(:receipt)   { create :receipt }

  before do
    login_as(user)
    visit receipts_path
  end

  it "User can select receipts by their category" do
    receipt.categories << category

    click_link category.name

    expect(page).to have_content receipt.title
    expect(page).to have_content category.name
  end
end
