class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :code
      t.string :description
      t.float :price
      t.string :category

      t.timestamps
    end
  end
end
