FactoryGirl.define do
  factory :receipt do
    published true
    description "vārīt 2 stundas"
    components "1 karote cukurs, 2 karotes sāls"
    title "Skābā karote"
  end
end

# == Schema Information
#
# Table name: receipts
#
#  id                 :integer          not null, primary key
#  user_id            :integer
#  title              :string
#  components         :text
#  description        :text
#  published          :boolean          default(FALSE)
#  published_at       :datetime
#  created_at         :datetime
#  updated_at         :datetime
#  photo_file_name    :string
#  photo_content_type :string
#  photo_file_size    :integer
#  photo_updated_at   :datetime
#
