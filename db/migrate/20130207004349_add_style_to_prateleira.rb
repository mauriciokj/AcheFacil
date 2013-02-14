class AddStyleToPrateleira < ActiveRecord::Migration
  def change
    add_column :prateleiras, :style, :string
  end
end
