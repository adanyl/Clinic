# frozen_string_literal: true

class Doctor < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone, uniqueness: true
  validates :name, uniqueness: true

  belongs_to :category, optional: true

  has_many :appointments, dependent: :destroy

  validates_length_of :appointments, maximum: 10

  has_many :users, through: :appointments

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
