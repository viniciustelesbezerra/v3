class RemaneFileToArquivos < ActiveRecord::Migration
  def change
    rename_column :arquivos, :file, :image
  end

end
