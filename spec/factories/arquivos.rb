# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :arquivo do
    tipo "MyString"
    em_uso false
    carregado_evora false
    data_carregado_evora "2013-02-23 14:32:04"
    user nil
  end
end
