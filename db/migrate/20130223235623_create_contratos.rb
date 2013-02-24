class CreateContratos < ActiveRecord::Migration
  def change
    create_table :contratos do |t|
      t.integer :numero					,null: false
      t.string :fornecedor				,null: false
      t.string :comprador_responsavel	,null: false

      t.timestamps
    end
  end
end
