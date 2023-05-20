class AddDescriptionToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :description, :string
  end
end
