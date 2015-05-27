require 'spec_helper'

feature "Users" do
  let!(:admin)      { create :user, :admin }

  before do
    login_as(admin)
  end

  it "Admin can ban users" do
    other_user = create(:other_user)

    visit admin_users_path

    click_link I18n.t('ban')

    expect(User.last.is_banned).to eq true
  end

  it "Admin can unban users" do
    other_user = create(:other_user, :banned)

    visit admin_users_path

    click_link I18n.t('unban')

    expect(User.last.is_banned).to eq false
  end
end
