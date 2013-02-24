# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :contrato do
    numero 1
    fornecedor "MyString"
    comprador_responsavel "MyString"
  end
end
