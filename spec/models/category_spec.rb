require 'spec_helper'

describe Category do

	let(:category) { FactoryGirl.build(:category) }

	context "fields" do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:title).of_type(:string) }
    it { should have_db_column(:description).of_type(:text) }    
    it { should have_db_column(:created_at).of_type(:datetime) }            
    it { should have_db_column(:updated_at).of_type(:datetime) } 
  end

  context "mass assignment" do
    it { should_not allow_mass_assignment_of(:id) }
    it { should_not allow_mass_assignment_of(:user_id) }
    it { should allow_mass_assignment_of(:title) }
    it { should allow_mass_assignment_of(:description) }
    it { should_not allow_mass_assignment_of(:created_at) }
    it { should_not allow_mass_assignment_of(:updated_at) }
  end

  context 'validations' do
  	it { should validate_presence_of(:title) }
  	it { should validate_presence_of(:description) }
  	
  end

end
