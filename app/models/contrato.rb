class Contrato < ActiveRecord::Base
	has_many :abrangencias, dependent: :destroy
  	has_many :ufs, through: :abrangencias
  	attr_accessible :comprador_responsavel, :fornecedor, :numero, :abrangencias_attributes, :ufs_attributes
  	accepts_nested_attributes_for :abrangencias, :ufs#, :allow_destroy => true
end
