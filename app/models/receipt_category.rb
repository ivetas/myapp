class ReceiptCategory < ActiveRecord::Base
  belongs_to :receipt
  belongs_to :category
end

# == Schema Information
#
# Table name: receipt_categories
#
#  id          :integer          not null, primary key
#  receipt_id  :integer
#  category_id :integer
#  created_at  :datetime
#  updated_at  :datetime
#
