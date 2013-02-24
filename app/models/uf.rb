class Uf < ActiveRecord::Base
	has_many :abrangencias, dependent: :destroy
	has_many :contratos, through: :abrangencias	
  	attr_accessible :name
end
