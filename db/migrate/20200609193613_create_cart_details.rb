class CreateCartDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :cart_details do |t|
      t.references :cart, foreign_key: true
      t.references :medicament, foreign_key: true
      t.integer :quantity

      t.timestamps
    end
  end
end
