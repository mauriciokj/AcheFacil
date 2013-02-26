class AddLarguraEComprimentoToPrateleiras < ActiveRecord::Migration
  def change
    add_column :prateleiras, :largura, :integer
    add_column :prateleiras, :comprimento, :integer
  end
end
