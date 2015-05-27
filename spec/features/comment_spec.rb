require 'spec_helper'

feature "Comment" do
  let!(:other_user)     { create :other_user }
  let!(:receipt)        { create :receipt }

  before do
    login_as(other_user)
    visit receipt_path(receipt)
  end

  it "User can comment receipts" do
    fill_in "comment_message", with: "Ļoti garšīgi!"

    click_button I18n.t('submit')

    expect(page).to have_content I18n.t('comments.create.notice')
    expect(page).to have_content receipt.comments.first.user.username
    expect(page).to have_content receipt.comments.first.message
  end

  it "User tries to send empty comment" do
    fill_in "comment_message", with: ""

    click_button I18n.t('submit')

    expect(page).to have_content I18n.t('comments.create.alert')
  end
end
