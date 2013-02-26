# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  
  factory :uf do
    name "MyString"
  	
  	trait :invalid do
    end
    
    factory :uf_invalid, traits: [:invalid]
  	end

end
