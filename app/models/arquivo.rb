class Arquivo < ActiveRecord::Base
  belongs_to :user
  attr_accessible :carregado_evora, :data_carregado_evora, :em_uso, :tipo
end
