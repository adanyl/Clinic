# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[6.1]
  def change
    create_table :categories do |t|
      t.text :name
      t.text :description

      t.timestamps
    end
  end
end
