class RemoveDoctorIdFromAppointments < ActiveRecord::Migration[6.1]
  def change
    remove_reference :appointments, :doctor, foreign_key: true
  end
end
