class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :receipt

  validates :message, presence: :true

  self.per_page = 5
end

# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  receipt_id :integer
#  user_id    :integer
#  message    :text
#  created_at :datetime
#  updated_at :datetime
#
