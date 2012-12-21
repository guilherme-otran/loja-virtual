class AddCategoryToProduct < ActiveRecord::Migration
  def change
    remove_column :products, :category
    add_column :products, :category, :integer
  end
end
