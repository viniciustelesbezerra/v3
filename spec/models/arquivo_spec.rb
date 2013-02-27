require 'spec_helper'

describe Arquivo do
   	let!(:arquivo) { FactoryGirl.create(:arquivo) }

   	context "Model validation" do
   		it { arquivo.should be_instance_of(Arquivo) }
   		it { arquivo.should be_valid }
   	end

   	context "Relations" do
   		it { should belong_to(:user) }
   	end

   	context "Attribute validations" do
   		array_presences_and_acssible = [:carregado_evora, :data_carregado_evora, :em_uso, :tipo, :user_id, :image]

   		context "Mass-assignment allowed and should de present" do
   			array_presences_and_acssible.each do |attr|
	 			   it { arquivo.should allow_mass_assignment_of(attr) }
               it { arquivo.should validate_presence_of(attr) }
	 		   end

   		end

   		context "Not-Allowed" do
   			[:id, :created_at, :updated_at].each do |attr|
	 			   it { arquivo.should_not allow_mass_assignment_of(attr) }
	 		   end
   		end

	   	context "Not-validated" do
	   		[:created_at, :updated_at].each do |attr|
				  it { arquivo.should_not allow_mass_assignment_of(attr) }
			   end

	   	end

   	end

      context "Call search" do
         let!(:other_arquivo) { FactoryGirl.create(:other_arquivo) }

         it "Returning search values" do
            params = { search: "arquivos", file_name_arquivos: "week", user_name: "admin" }
            Arquivo.search(params).should eq([arquivo])
         end

         it "Returning all values" do
            params = { search: "" }
            Arquivo.search(params).should include(arquivo)
         end

      end

end
