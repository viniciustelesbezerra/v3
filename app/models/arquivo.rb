class Arquivo < ActiveRecord::Base
  	belongs_to :user
  	attr_accessible :carregado_evora, :data_carregado_evora, :em_uso, :tipo, :user_id, :image
  	validates_presence_of :carregado_evora, :data_carregado_evora, :em_uso, :tipo, :user_id, :image
  	mount_uploader :image, FileUploader

   	def self.search(search)
	   	search[:search].eql?("arquivos") ? includes(:user).where(["arquivos.image like ? AND users.name like ? ", "%#{search[:file_name_arquivos]}%", "%#{search[:user_name]}%"]) : includes(:user).all 
	end

end
