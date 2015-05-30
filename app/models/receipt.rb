class Receipt < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :receipt_categories
  has_many :categories, through: :receipt_categories

  before_save :receipt_published_at

  validates :description, presence: true
  validates :title, presence: true, uniqueness: true

  self.per_page = 5

  has_attached_file :photo, :styles => { :small => "150x150>", :medium => "300x300>" },
                    :url  => "/assets/receipts/:id/:style/:basename.:extension",
                    :path => ":rails_root/public/assets/receipts/:id/:style/:basename.:extension"

  validates_attachment_size :photo, :less_than => 5.megabytes
  validates_attachment_content_type :photo, :content_type => ['image/jpeg', 'image/png']

  ratyrate_rateable "vote"

  def self.search(query)
    where("title ilike ?", "%#{query}%")
  end
  
  scope :published, -> { where(published: true) }

  def receipt_published_at
    self.published_at = self.published? ? Time.now : nil
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
