require 'spec_helper'
require "cancan/matchers"


describe "User" do
  describe "abilities" do
    subject(:ability){ Ability.new(user) }
    let(:user){ nil }

    context "when guest" do
      
      it{ should be_able_to(:read, Category.new) }
      it{ should_not be_able_to(:manage, Category.new) }      
    end


    context "when user" do
      
      let(:user){ FactoryGirl.create(:user) }

      it{ should be_able_to(:read, Category.new) }
      it{ should_not be_able_to(:manage, Category.new) }      
    end    

    context "when tech manager" do
      
      let(:user){ FactoryGirl.create(:tech_manager) }

      it{ should be_able_to(:read, Category.new) }
      it{ should be_able_to(:manage, Category.new) }      
    end    

    context "when superuser" do
      
      let(:user){ FactoryGirl.create(:superuser) }

      it{ should be_able_to(:read, Category.new) }
      it{ should be_able_to(:manage, Category.new) }      
    end    


  end
end
