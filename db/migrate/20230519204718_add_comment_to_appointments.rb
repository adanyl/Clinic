class AddCommentToAppointments < ActiveRecord::Migration[6.1]
  def change
    add_column :appointments, :comment, :string
  end
end
