class Lpu < ActiveRecord::Base
  	belongs_to :arquivo
  	attr_accessible :carregado_evora, :data_carregado_evora, :provedor, :arquivo_id  
  	validates_presence_of :carregado_evora, :data_carregado_evora, :provedor, :arquivo_id  

   	def self.search(search)
	   	search[:search].eql?("lpus") ? 
	   	includes(:arquivo).where(["arquivos.image like ? AND lpus.provedor like ? ", "%#{search[:file_name_lpus]}%", "%#{search[:provedor_name]}%"]) 
	   	: includes(:arquivo).all
	end

end
