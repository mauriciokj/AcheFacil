class AddAmbienteIdToPrateleira < ActiveRecord::Migration
  def change
    add_column :prateleiras, :ambiente_id, :integer
  end
end
