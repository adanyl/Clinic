class Appointment < ApplicationRecord
    belongs_to :user
    belongs_to :doctor

    validates :date, uniqueness: { scope: [:time, :user_id, :doctor_id] }
end