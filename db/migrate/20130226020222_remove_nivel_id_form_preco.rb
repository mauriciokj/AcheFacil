class RemoveNivelIdFormPreco < ActiveRecord::Migration
  def up
    remove_column :produtos, :nivel_id
  end

  def down
    add_column :produtos, :nivel_id, :integer
  end

end
