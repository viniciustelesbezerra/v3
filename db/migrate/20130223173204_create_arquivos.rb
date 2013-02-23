class CreateArquivos < ActiveRecord::Migration
  def change
    create_table :arquivos do |t|
      t.string :tipo                    , limit: 1
      t.boolean :em_uso                 , default: false
      t.boolean :carregado_evora        , default: false
      t.datetime :data_carregado_evora   
      t.references :user

      t.timestamps
    end
    add_index :arquivos, :user_id
  end
end
