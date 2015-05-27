FactoryGirl.define do
  factory :comment, class: Comment do
    body "Izcila recepte! Paldies!"
    user
  end
end
