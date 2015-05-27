class CreateReceipts < ActiveRecord::Migration
  def change
    create_table :receipts do |t|
      t.integer     :user_id
      t.string      :title
      t.text        :components
      t.text        :description
      t.boolean     :published, :default => false
      t.datetime    :published_at
      t.timestamps
    end
  end
end
