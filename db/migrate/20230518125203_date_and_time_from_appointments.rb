class DateAndTimeFromAppointments < ActiveRecord::Migration[6.1]
  def change
    remove_columns :appointments, :date, :time
  end
end
