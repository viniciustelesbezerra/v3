class Arquivo < ActiveRecord::Base
  belongs_to :user
  attr_accessible :carregado_evora, :data_carregado_evora, :em_uso, :tipo, :user_id
  validates_presence_of :carregado_evora, :data_carregado_evora, :em_uso, :tipo, :user_id
end
