class AddEmpresaToAmbiente < ActiveRecord::Migration
  def change
    add_column :ambientes, :empresa_id, :integer
  end
end
