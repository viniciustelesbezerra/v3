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

   		context "Mass-assignment Allowed" do
   			array_presences_and_acssible.each do |attr|
	 			   it { arquivo.should allow_mass_assignment_of(attr) }
	 		   end

   		end

   		context "Not-Allowed" do
   			[:id, :created_at, :updated_at].each do |attr|
	 			   it { arquivo.should_not allow_mass_assignment_of(attr) }
	 		   end
   		end

	      context "Presence of Validated" do
	   		array_presences_and_acssible.each do |attr|
				  it { arquivo.should allow_mass_assignment_of(attr) }
			   end

	   	end

	   	context "Not-validated" do
	   		[:created_at, :updated_at].each do |attr|
				  it { arquivo.should_not allow_mass_assignment_of(attr) }
			   end

	   	end

   	end

      it "Call search" do
         subject.send(:search,search).should eq("")
      end

end
