# == Schema Information
#
# Table name: time_slots
#
#  id        :bigint           not null, primary key
#  date      :date             not null
#  status    :integer          default("available")
#  time      :time             not null
#  doctor_id :bigint
#
# Indexes
#
#  index_time_slots_on_doctor_id  (doctor_id)
#
class TimeSlot < ApplicationRecord
  validates :time, uniqueness: { scope: %i[doctor_id date] }
  belongs_to :doctor
  has_one :appointment

  enum status: { available: 0, not_available: 1, passed: 2 }
end
