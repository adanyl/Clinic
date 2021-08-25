class AddCategoryToDoctors < ActiveRecord::Migration[6.1]
  def change
    add_column :doctors, :category_id, :integer
  end
end
