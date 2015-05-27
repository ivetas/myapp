require 'spec_helper'

feature "Categories" do
  let!(:admin)     { create :user, :admin }
  let!(:category)  { create :category }

  before do
    login_as(admin)
    visit admin_categories_path
  end

  it "Admin sees all categories" do
    expect(page).to have_content category.name
  end

  it "Admin can create new category" do
    click_link I18n.t('admin.categories.index.add_category')

    expect(page).to have_content I18n.t('admin.categories.new.new_category')

    fill_in Category.human_attribute_name(:name), with: "Kūkas"

    click_button I18n.t('save')

    expect(page).to have_content I18n.t('admin.categories.create.notice')
    expect(Category.last.name).to eq "Kūkas"
  end

  it "Admin can edit category" do
    click_link I18n.t('edit')

    expect(page).to have_content I18n.t('admin.categories.edit.edit_category')

    fill_in Category.human_attribute_name(:name), with: "Zupas"
    click_button I18n.t('save')

    expect(page).to have_content I18n.t('admin.categories.update.notice')
    expect(Category.last.name).to eq "Zupas"
  end

  it "Admin can delete categories" do
    expect(page).to have_content category.name

    click_link I18n.t('destroy')

    expect(page).to_not have_content category.name

    expect(page).to have_content I18n.t('admin.categories.destroy.notice')
    expect(Category.count).to eq 0
  end

  it "Creating category without filling name field will show error" do
    click_link I18n.t('admin.categories.index.add_category')

    click_button I18n.t('save')

    expect(page).to have_content I18n.t('error')
    expect(Category.count).to eq 1
  end
end
