require 'spec_helper'

feature "Receipt" do
  let!(:user)     { create :user }
  let!(:receipt)  { create :receipt, user: user }
  let!(:category) { create :category }

  before do
    login_as(user)
    visit my_receipts_path
  end

  it "All published receipts" do
    visit receipts_path
    expect(page).to have_content receipt.title
  end

  it "User sees his own created receipts" do
    expect(page).to have_content receipt.title
  end

  it "User can create new receipts seen only by him" do
    click_link I18n.t('my_receipts.index.add_receipt')

    expect(page).to have_content I18n.t('my_receipts.new.new_receipt')

    fill_in Receipt.human_attribute_name(:title), with: "Zemeņu gardums"
    fill_in Receipt.human_attribute_name(:components), with: "1. Zemens 2. cukurs 3. piens"
    fill_in Receipt.human_attribute_name(:description), with: "1. Sagriez zemens 2. Pieber cukuru 3. Uzlej pienu"

    click_button I18n.t('save')

    expect(page).to have_content I18n.t('receipts.create.notice')
    expect(Receipt.last.title).to eq "Zemeņu gardums"
    expect(Receipt.last.components).to eq "1. Zemens 2. cukurs 3. piens"
    expect(Receipt.last.description).to eq "1. Sagriez zemens 2. Pieber cukuru 3. Uzlej pienu"
  end

  it "User can create new receipts seen by everyone" do
    click_link I18n.t('my_receipts.index.add_receipt')

    expect(page).to have_content I18n.t('my_receipts.new.new_receipt')

    fill_in Receipt.human_attribute_name(:title), with: "Zemeņu gardums visiem"
    fill_in Receipt.human_attribute_name(:components), with: "1. Zemens 2. cukurs 3. piens"
    fill_in Receipt.human_attribute_name(:description), with: "1. Sagriez zemens 2. Pieber cukuru 3. Uzlej pienu"

    check Receipt.human_attribute_name(:published)

    click_button I18n.t('save')

    expect(page).to have_content I18n.t('receipts.create.notice')
    expect(Receipt.last.title).to eq "Zemeņu gardums visiem"
    expect(Receipt.last.components).to eq "1. Zemens 2. cukurs 3. piens"
    expect(Receipt.last.description).to eq "1. Sagriez zemens 2. Pieber cukuru 3. Uzlej pienu"
    expect(Receipt.last.published).to eq true
  end

  it "User can create new receipts and add category to it" do
    click_link I18n.t('my_receipts.index.add_receipt')

    expect(page).to have_content I18n.t('my_receipts.new.new_receipt')

    fill_in Receipt.human_attribute_name(:title), with: "Zemeņu gardums visiem"
    fill_in Receipt.human_attribute_name(:components), with: "1. Zemens 2. cukurs 3. piens"
    fill_in Receipt.human_attribute_name(:description), with: "1. Sagriez zemens 2. Pieber cukuru 3. Uzlej pienu"

    check category.name

    click_button I18n.t('save')

    expect(page).to have_content I18n.t('receipts.create.notice')
    expect(Receipt.last.title).to eq "Zemeņu gardums visiem"
    expect(Receipt.last.components).to eq "1. Zemens 2. cukurs 3. piens"
    expect(Receipt.last.description).to eq "1. Sagriez zemens 2. Pieber cukuru 3. Uzlej pienu"
    expect(Receipt.last.categories.first.name).to eq category.name
  end

  it "User can edit his receipts" do
    click_link I18n.t('edit')

    expect(page).to have_content I18n.t('my_receipts.edit.edit_receipt')
    expect(page).to have_content Receipt.human_attribute_name(:published)

    fill_in Receipt.human_attribute_name(:title), with: "Zemeņu gardums ar putukrējumu"
    fill_in Receipt.human_attribute_name(:components), with: "1. Zemens 2. cukurs 3. piens 4. putukrējums"
    fill_in Receipt.human_attribute_name(:description), with: "1. Sagriez zemens 2. Pieber cukuru 3. Uzlej pienu 4. Pārspied putukrējumu pāri"

    click_button I18n.t('save')

    expect(page).to have_content I18n.t('receipts.update.notice')
    expect(Receipt.last.title).to eq "Zemeņu gardums ar putukrējumu"
    expect(Receipt.last.components).to eq "1. Zemens 2. cukurs 3. piens 4. putukrējums"
    expect(Receipt.last.description).to eq "1. Sagriez zemens 2. Pieber cukuru 3. Uzlej pienu 4. Pārspied putukrējumu pāri"
  end

  it "User can edit his receipts and attach file to them" do
    file_path = Rails.root.join('spec', 'files', 'saldejums.jpg')
    click_link I18n.t('edit')

    expect(page).to have_content I18n.t('my_receipts.edit.edit_receipt')
    expect(page).to have_content Receipt.human_attribute_name(:published)

    fill_in Receipt.human_attribute_name(:title), with: "Zemeņu gardums ar putukrējumu"
    fill_in Receipt.human_attribute_name(:components), with: "1. Zemens 2. cukurs 3. piens 4. putukrējums"
    fill_in Receipt.human_attribute_name(:description), with: "1. Sagriez zemens 2. Pieber cukuru 3. Uzlej pienu 4. Pārspied putukrējumu pāri"

    attach_file("receipt_photo", file_path)

    click_button I18n.t('save')

    expect(page).to have_content I18n.t('receipts.update.notice')
    expect(Receipt.last.title).to eq "Zemeņu gardums ar putukrējumu"
    expect(Receipt.last.components).to eq "1. Zemens 2. cukurs 3. piens 4. putukrējums"
    expect(Receipt.last.description).to eq "1. Sagriez zemens 2. Pieber cukuru 3. Uzlej pienu 4. Pārspied putukrējumu pāri"
  end

  it "User can delete his receipts" do
    expect(page).to have_content receipt.title

    click_link I18n.t('destroy')

    expect(page).to_not have_content receipt.title

    expect(page).to have_content I18n.t('receipts.destroy.notice')
    expect(Receipt.count).to eq 0
  end

  it "Creating receipt without filling title and description field will show error" do
    click_link I18n.t('receipts.index.add_receipt')

    fill_in Receipt.human_attribute_name(:components), with: "1. Krējums 2. cukurs"

    click_button I18n.t('save')

    expect(page).to have_content I18n.t('error')
    expect(Receipt.count).to eq 1
  end
end
