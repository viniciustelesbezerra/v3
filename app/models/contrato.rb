class Contrato < ActiveRecord::Base
	  has_many :abrangencias, dependent: :destroy
  	has_many :ufs, through: :abrangencias
  	attr_accessible :comprador_responsavel, :fornecedor, :numero

  	def create_ufs_relation!(ufs_ids)
      	ufs_ids.each{ |id_uf| self.ufs.push(Uf.find(id_uf)) }
  	end

  	def update_ufs_relation!(ufs_ids)
   		  found_ids = []
		    @contrato_ufs = self.ufs
      	@contrato_ufs.find_each{ |ids_uf| found_ids.push(ids_uf.id) } 
      	ufs_ids.each{ |id_uf| found_ids.include?(id_uf.to_i) ? found_ids.delete(id_uf.to_i) : @contrato_ufs.push(Uf.find(id_uf)) }
      	found_ids.each do |ids_to_delete|
        	@relation = @contrato_ufs.find(ids_to_delete)
          puts @relation.inspect
        	@contrato_ufs.delete(@relation)
      	end
	end

end
