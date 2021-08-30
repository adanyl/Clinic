# frozen_string_literal: true

class Remove < ActiveRecord::Migration[6.1]
  def change
    remove_column :doctors, :category_id
  end
end
