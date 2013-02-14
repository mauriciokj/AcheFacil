class CreateNiveis < ActiveRecord::Migration
  def change
    create_table :niveis do |t|
      t.references :prateleira
      t.integer :numero

      t.timestamps
    end
    add_index :niveis, :prateleira_id
  end
end
