require 'spec_helper'

feature "Article" do
  let!(:user)     { create :user }
  let!(:article)  { create :article }

  before do
    login_as(user)
    visit articles_path
  end

  it "User sees all published articles" do
    expect(page).to have_content article.title
  end
end
