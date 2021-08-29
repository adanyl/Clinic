class AddTimeToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :time, :time
  end
end
