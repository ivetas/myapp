class CreateReceiptCategories < ActiveRecord::Migration
  def change
    create_table :receipt_categories do |t|
      t.integer    :receipt_id
      t.integer    :category_id
      t.timestamps
    end
  end
end
