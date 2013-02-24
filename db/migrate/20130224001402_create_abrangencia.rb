class CreateAbrangencia < ActiveRecord::Migration
  def change
    create_table :abrangencia do |t|
        t.integer  :contrato_id, null: false
    	t.integer  :uf_id, null: false
    	
      	t.timestamps
    end
  
    add_index :abrangencia, :contrato_id
	add_index :abrangencia, :uf_id

  end
end
