require 'spec_helper'

describe Comment do

	let(:comment) { FactoryGirl.build(:comment) }

	context "fields" do
    it { should have_db_column(:id).of_type(:integer) }
    it { should have_db_column(:user_id).of_type(:integer) }
    it { should have_db_column(:content).of_type(:text) }
    it { should have_db_column(:commentable_id).of_type(:integer) }
    it { should have_db_column(:commentable_type).of_type(:string) }        
    it { should have_db_column(:created_at).of_type(:datetime) }            
    it { should have_db_column(:updated_at).of_type(:datetime) } 
  end

  context "mass assignment" do
    it { should_not allow_mass_assignment_of(:id) }
    it { should_not allow_mass_assignment_of(:user_id) }
    it { should allow_mass_assignment_of(:content) }
    it { should allow_mass_assignment_of(:commentable_id) }
    it { should allow_mass_assignment_of(:commentable_type) }  
    it { should_not allow_mass_assignment_of(:created_at) }
    it { should_not allow_mass_assignment_of(:updated_at) }
  end

  context 'validations' do
  	#it { should validate_presence_of(:user_id) }
  	it { should validate_presence_of(:content) }

  	
  end
end

