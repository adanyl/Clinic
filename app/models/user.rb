class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :phone, uniqueness: true
  validates :name, uniqueness: true

  has_many :appointments, dependent: :destroy
  has_many :doctors, through: :appointments


def email_required?
 false
end

def email_changed?
 false
end
end
