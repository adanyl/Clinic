# frozen_string_literal: true

class AddPhoneToDoctors < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :phone, :string
  end
end
