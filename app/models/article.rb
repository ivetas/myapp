class Article < ActiveRecord::Base
  before_save :set_articles_publishing_time

  validates :title, :description, presence: true

  scope :published, -> { where(published: true) }

  has_attached_file :photo, :styles => { :small => "150x150>" },
                    :url  => "/assets/articles/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/articles/:id/:style/:basename.:extension"

  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  def set_articles_publishing_time
    self.published_at = self.published? ? Time.now : nil
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
