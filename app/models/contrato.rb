class Contrato < ActiveRecord::Base
	  has_many :abrangencias, dependent: :destroy
  	has_many :ufs, through: :abrangencias
  	attr_accessible :comprador_responsavel, :fornecedor, :numero, :uf_ids
end
