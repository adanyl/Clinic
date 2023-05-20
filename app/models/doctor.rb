# frozen_string_literal: true

# == Schema Information
#
# Table name: doctors
#
#  id                     :bigint           not null, primary key
#  description            :string           default("")
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  name                   :string
#  phone                  :string
#  remember_created_at    :datetime
#  reset_password_sent_at :datetime
#  reset_password_token   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  category_id            :bigint
#
# Indexes
#
#  index_doctors_on_category_id           (category_id)
#  index_doctors_on_reset_password_token  (reset_password_token) UNIQUE
#
# Foreign Keys
#
#  fk_rails_...  (category_id => categories.id)
#
class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone, uniqueness: true
  validates :name, uniqueness: true

  belongs_to :category, optional: true

  has_many :users, through: :appointments
  has_many :time_slots, dependent: :destroy
  has_many :appointments, through: :time_slots

  has_one_attached :avatar

  def self.search(search)
    where('cast(category_id as text) LIKE ?', "%#{search}")
  end

  def email_required?
    false
  end

  def email_changed?
    false
  end
end
