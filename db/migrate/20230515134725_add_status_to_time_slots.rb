class AddStatusToTimeSlots < ActiveRecord::Migration[6.1]
  def change
    add_column :time_slots, :status, :integer, default: 0
  end
end
