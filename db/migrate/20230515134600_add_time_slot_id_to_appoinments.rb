class AddTimeSlotIdToAppoinments < ActiveRecord::Migration[6.1]
  def change
    add_reference :appointments, :time_slot, index: true
  end
end
