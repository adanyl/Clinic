class CreateTimeSlots < ActiveRecord::Migration[6.1]
  def change
    create_table :time_slots do |t|
      t.references :doctor, index: true
      t.date :date, null: false
      t.time :time, null: false
    end
  end
end
