FactoryGirl.define do
  factory :comment, class: Comment do
    message "Izcila recepte! Paldies!"
    user
  end
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
