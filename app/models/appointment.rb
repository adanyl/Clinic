class Appointment < ApplicationRecord
    belongs_to :user
    belongs_to :doctor
    validates_associated :doctor
    
    has_one :comment

    validates :date, uniqueness: { scope: [:time, :user_id, :doctor_id] }
    

end