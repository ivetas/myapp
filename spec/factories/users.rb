FactoryGirl.define do
  factory :user do
    email "epasts@epasts.com"
    username "lietotajs"
    password "parole12"
  end

  factory :other_user, class: User do
    email "other@epasts.com"
    username "citslietotajs"
    password "parole123"
  end

  trait :admin do
    is_admin true
  end

  trait :banned do
    is_banned true
  end
end

# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :inet
#  last_sign_in_ip        :inet
#  is_admin               :boolean          default(FALSE)
#  is_banned              :boolean          default(FALSE)
#  username               :string
#  created_at             :datetime
#  updated_at             :datetime
#
