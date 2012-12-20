class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.text :description
      t.float :price
      t.string :category

      t.timestamps
    end
  end
end
