class Category < ActiveRecord::Base
  has_many :receipt_categories
  has_many :receipts, through: :receipt_categories

  validates :name, presence: true

  def self.search(query)
    where("title ilike ?", "%#{query}%")
  end
end

# == Schema Information
#
# Table name: categories
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime
#  updated_at :datetime
#
