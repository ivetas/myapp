require 'spec_helper'

feature "Articles" do
  let!(:admin)     { create :user, :admin }
  let!(:article)  { create :article }

  before do
    login_as(admin)
    visit admin_articles_path
  end

  it "Admin sees all articles" do
    expect(page).to have_content article.title
  end

  it "Admin can create new article" do
    click_link I18n.t('admin.articles.index.add_article')

    expect(page).to have_content I18n.t('admin.articles.new.new_article')

    fill_in Article.human_attribute_name(:title), with: "Ēd cik uziet"
    fill_in Article.human_attribute_name(:description), with: "Jāēd 5 reizes dienā!"

    click_button I18n.t('save')

    expect(page).to have_content I18n.t('admin.articles.create.notice')
    expect(Article.last.title).to eq "Ēd cik uziet"
    expect(Article.last.description).to eq "Jāēd 5 reizes dienā!"
  end

  it "Admin can edit articles" do
    click_link I18n.t('edit')

    expect(page).to have_content I18n.t('admin.articles.edit.edit_article')
    expect(page).to have_content Article.human_attribute_name(:published)

    fill_in Article.human_attribute_name(:title), with: "Jauns saldējums"
    fill_in Article.human_attribute_name(:description), with: "Vēl vairāk piena!"
    click_button I18n.t('save')

    expect(page).to have_content I18n.t('admin.articles.update.notice')
    expect(Article.last.title).to eq "Jauns saldējums"
    expect(Article.last.description).to eq "Vēl vairāk piena!"
  end

  it "Admin can delete articles" do
    expect(page).to have_content article.title

    click_link I18n.t('destroy')

    expect(page).to_not have_content article.title

    expect(page).to have_content I18n.t('admin.articles.destroy.notice')
    expect(Article.count).to eq 0
  end

  it "Creating article without filling title and text field field will show error" do
    click_link I18n.t('admin.articles.index.add_article')

    click_button I18n.t('save')

    expect(page).to have_content I18n.t('error')
    expect(Article.count).to eq 1
  end
end
