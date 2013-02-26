# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :contrato do
    numero 111
    fornecedor "forn"
    comprador_responsavel "compr_resp"

    trait :invalid do
    end
        
    factory :contrato_invalid, traits: [:invalid]
  end

end
