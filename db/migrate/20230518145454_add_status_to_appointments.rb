class AddStatusToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :status, :int, default: 0
  end
end
