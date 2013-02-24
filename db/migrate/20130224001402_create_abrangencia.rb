class CreateAbrangencia < ActiveRecord::Migration
  def change
    create_table :abrangencia do |t|

      t.timestamps
    end
  end
end
