class AddImagemToPrateleira < ActiveRecord::Migration
  def change
    add_column :prateleiras, :imagem, :string
    remove_column :empresas, :prateleira
  end
end
