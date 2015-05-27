FactoryGirl.define do
  factory :article, class: Article do
    published true
    description "Daudz ēdiens! Būs labi!"
    title "Nom Nom Nom"
  end
end

# == Schema Information
#
# Table name: articles
#
#  id                 :integer          not null, primary key
#  title              :string
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
