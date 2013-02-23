class AddFileToArquivos < ActiveRecord::Migration
  def change
    add_column :arquivos, :file, :string
  end
end
