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

FactoryGirl.define do
  factory :comment, class: Comment do
    body "Izcila recepte! Paldies!"
    user
  end
end
