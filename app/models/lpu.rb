class Lpu < ActiveRecord::Base
  belongs_to :arquivo
  attr_accessible :carregado_evora, :data_carregado_evora, :provedor
end
