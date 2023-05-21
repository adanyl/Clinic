# frozen_string_literal: true

# == Schema Information
#
# Table name: appointments
#
#  id           :bigint           not null, primary key
#  comment      :string
#  status       :integer          default("scheduled")
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  time_slot_id :bigint
#  user_id      :bigint
#
# Indexes
#
#  index_appointments_on_time_slot_id  (time_slot_id)
#  index_appointments_on_user_id       (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Appointment < ApplicationRecord
  belongs_to :user
  belongs_to :time_slot, dependent: :destroy
  has_one :doctor, through: :time_slot

  enum status: { scheduled: 0, completed: 1, canceled: 2 }

  after_save :update_time_slot_status

  def update_time_slot_status
    time_slot.passed! if completed?
  end

  def ukr_status
    case status
    when 'scheduled'
      'Заплановано'
    when 'completed'
      'Завершено'
    else
      'Скасовано'
    end
  end
end
