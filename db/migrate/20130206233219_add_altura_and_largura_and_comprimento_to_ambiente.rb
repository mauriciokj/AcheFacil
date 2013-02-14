class AddAlturaAndLarguraAndComprimentoToAmbiente < ActiveRecord::Migration
  def change
    add_column :ambientes, :altura, :float
    add_column :ambientes, :largura, :float
    add_column :ambientes, :comprimento, :float
  end
end
