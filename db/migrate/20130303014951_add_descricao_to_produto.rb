class AddDescricaoToProduto < ActiveRecord::Migration
  def change
    add_column :produtos, :descricao, :text
  end
end
