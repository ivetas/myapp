require 'spec_helper'

feature "Receipts" do
  let!(:admin)      { create :user, :admin }
  let!(:other_user) { create :other_user }
  let!(:receipt)    { create :receipt, user: other_user }

  before do
    login_as(admin)
  end

  it "Admin can delete any user receipts" do
    visit receipts_path

    expect(page).to have_content receipt.title

    click_link I18n.t('destroy')

    expect(page).to_not have_content receipt.title

    expect(page).to have_content I18n.t('receipts.destroy.notice')
    expect(Receipt.count).to eq 0
  end

  it "Admin can delete receipts comments" do
    comment = create(:comment, user: other_user)
    receipt.comments << comment
    visit receipt_path(receipt)

    click_link I18n.t('destroy')

    expect(Comment.count).to eq 0
  end
end
