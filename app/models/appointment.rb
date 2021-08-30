# frozen_string_literal: true

class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :doctor
  validates_associated :doctor

  has_one :comment

  validates :date, uniqueness: { scope: %i[time user_id doctor_id] }
end
