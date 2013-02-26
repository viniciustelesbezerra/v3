# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

    factory :arquivo do
        tipo "A"
        em_uso true
        carregado_evora true
        data_carregado_evora "2013-02-23 14:32:04"
        image { File.open("#{Rails.root}/public/uploads/arquivo/image/1/week4.js") }

        trait :invalid do
        end
        
        trait :other do
            tipo "B"
            em_uso true
            carregado_evora true
            data_carregado_evora "2012-02-23 11:32:04"
            image { File.open("#{Rails.root}/public/uploads/arquivo/image/3/week4.js") }
            association :user, factory: :user
        end

        factory :other_arquivo, traits: [:other]
        factory :arquivo_invalid, traits: [:invalid]
      	association :user, factory: :admin
    end

end
