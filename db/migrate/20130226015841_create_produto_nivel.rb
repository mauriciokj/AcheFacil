class CreateProdutoNivel < ActiveRecord::Migration
  def self.up
    create_table :niveis_produtos, :id => false do |t|
      t.references :produto
      t.references :nivel
    end
    add_index :niveis_produtos, [:produto_id, :nivel_id]
    add_index :niveis_produtos, [:nivel_id, :produto_id]
  end

  def self.down
    drop_table :niveis_produtos
  end
end
