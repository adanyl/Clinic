# frozen_string_literal: true

class CreateComments < ActiveRecord::Migration[6.1]
  def change
    create_table :comments do |t|
      t.belongs_to :appointment
      t.string :text
      t.timestamps
    end
  end
end
