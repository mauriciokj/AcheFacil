class CreateEmpresas < ActiveRecord::Migration
  def change
    create_table :empresas do |t|
      t.string :nome
      t.string :razao_social
      t.string :cnpj
      t.string :telefone
      t.string :tipo
      t.string :prateleira

      t.timestamps
    end
  end
end
