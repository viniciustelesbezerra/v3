class CreateUfs < ActiveRecord::Migration
  def change
    create_table :ufs do |t|
      t.string :name	,null: false

      t.timestamps
    end
  end
end
