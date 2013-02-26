# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :lpu do
    provedor "Provedor a"
    carregado_evora true
    data_carregado_evora "2013-02-23 14:38:33"
    arquivo_id 1

    trait :invalid do
    end
        
    factory :lpu_invalid, traits: [:invalid]
    #association :arquivo, factory: :arquivo
  end

end
