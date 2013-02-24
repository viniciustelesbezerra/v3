class Abrangencia < ActiveRecord::Base
  belongs_to :contrato
  belongs_to :uf
  attr_accessible :contrato_id, :uf_id
end
