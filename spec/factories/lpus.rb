# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :lpu do
    provedor "MyString"
    carregado_evora false
    data_carregado_evora "2013-02-23 14:38:33"
    arquivo nil
  end
end
