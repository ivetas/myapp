class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  ratyrate_rater

  has_many :receipts
  has_many :comments

  validates :email, :username, presence: true, uniqueness: true

  self.per_page = 10

  # izmaina lietotāja atribūta is_banned vērtību uz patiess
  def ban
    self.is_banned = true
  end

  # izmaina lietotāja atribūta is_banned vērtību uz aplams
  def unban
    self.is_banned = false
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
