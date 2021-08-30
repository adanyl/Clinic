# frozen_string_literal: true

class AddNameToDoctors < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :name, :string
  end
end
