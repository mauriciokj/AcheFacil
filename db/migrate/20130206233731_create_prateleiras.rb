class CreatePrateleiras < ActiveRecord::Migration
  def change
    create_table :prateleiras do |t|
      t.string :descricao
      t.integer :x
      t.integer :y
      t.string :posicao
      t.float :tamanho

      t.timestamps
    end
  end
end
