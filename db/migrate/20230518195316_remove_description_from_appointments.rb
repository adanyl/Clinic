class RemoveDescriptionFromAppointments < ActiveRecord::Migration[6.1]
  def change
    remove_column :appointments, :description
  end
end
