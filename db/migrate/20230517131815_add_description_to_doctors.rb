class AddDescriptionToDoctors < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :description, :string, default: ''
  end
end
