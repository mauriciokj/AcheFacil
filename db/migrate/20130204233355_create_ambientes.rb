class CreateAmbientes < ActiveRecord::Migration
  def change
    create_table :ambientes do |t|
      t.string :nome

      t.timestamps
    end
  end
end
