# frozen_string_literal: true

class AddDateToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :date, :date
  end
end
