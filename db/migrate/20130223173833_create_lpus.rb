class CreateLpus < ActiveRecord::Migration
  def change
    create_table :lpus do |t|
      t.string :provedor
      t.boolean :carregado_evora        , default: false
      t.datetime :data_carregado_evora
      t.references :arquivo

      t.timestamps
    end
    add_index :lpus, :arquivo_id
  end
end
