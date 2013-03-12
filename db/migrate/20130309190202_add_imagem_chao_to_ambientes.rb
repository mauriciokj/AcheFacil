class AddImagemChaoToAmbientes < ActiveRecord::Migration
  def change
    add_column :ambientes, :imagem_chao, :string
  end
end
