class CreateAppointments < ActiveRecord::Migration[6.1]
  def change
    create_table :appointments do |t|

      t.belongs_to :user, foreign_key: true
      t.belongs_to :doctor, foreign_key: true

      t.timestamps

    end
  end
end
