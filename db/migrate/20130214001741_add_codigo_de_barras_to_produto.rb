class AddCodigoDeBarrasToProduto < ActiveRecord::Migration
  def change
    add_column :produtos, :codigo_de_barras, :string
  end
end
