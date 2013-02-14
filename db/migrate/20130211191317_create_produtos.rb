class CreateProdutos < ActiveRecord::Migration
  def change
    create_table :produtos do |t|
      t.references :nivel
      t.string :nome
      t.float :preco
      t.float :quantidade

      t.timestamps
    end
    add_index :produtos, :nivel_id
  end
end
