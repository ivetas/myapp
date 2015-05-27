class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :receipt

  validates :body, presence: :true
end

# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  receipt_id :integer
#  user_id    :integer
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#
