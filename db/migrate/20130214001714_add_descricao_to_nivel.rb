class AddDescricaoToNivel < ActiveRecord::Migration
  def change
    add_column :niveis, :descricao, :string
  end
end
