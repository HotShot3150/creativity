require 'spec_helper'

describe User do

	let(:user) { FactoryGirl.build(:user) }

	context "fields" do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:email).of_type(:string) }
    it { should have_db_column(:role).of_type(:string) }  
    it { should have_db_column(:created_at).of_type(:datetime) }            
    it { should have_db_column(:updated_at).of_type(:datetime) } 
  end

  context "mass assignment" do
    it { should_not allow_mass_assignment_of(:id) }
    it { should_not allow_mass_assignment_of(:role) }
    it { should allow_mass_assignment_of(:email) }
    it { should allow_mass_assignment_of(:password) }
    it { should allow_mass_assignment_of(:password_confirmation) }
    it { should allow_mass_assignment_of(:remember_me) }    
    it { should_not allow_mass_assignment_of(:created_at) }
    it { should_not allow_mass_assignment_of(:updated_at) }
  end

  context 'validations' do
  	it { should validate_presence_of(:email) }
  	it { should validate_uniqueness_of(:email) }  	
  	it { should validate_presence_of(:password) }  	
  end

end
