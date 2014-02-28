require 'spec_helper'
require "cancan/matchers"


describe "User" do
  describe "abilities" do
    subject(:ability){ Ability.new(user) }
    let(:user){ nil }
    let(:category){ FactoryGirl.create(:category) } 
    let(:post){ FactoryGirl.create(:post, category_id: category.id) }
    let(:project){ FactoryGirl.create(:project, category_id: category.id) } 
    let(:comment){ FactoryGirl.create(:comment) }   
    let(:user2) { FactoryGirl.create(:user, first_name: "User", last_name: "2") }


    context "when guest" do
      
      #For Categories
      it{ should be_able_to(:read, category) }
      it{ should_not be_able_to(:manage, category) }

      #For Comments
      it{ should be_able_to(:read, comment) }
      it{ should_not be_able_to(:manage, comment) }

      #For Posts 
      it{ should be_able_to(:read, post) }
      it{ should_not be_able_to(:manage, post) }

      #For Projects
      it{ should be_able_to(:read, project) }
      it{ should_not be_able_to(:manage, project) }     
    end


    context "when default_user" do
      
      let(:user){ FactoryGirl.create(:user) }     

     #For Categories
      it{ should be_able_to(:read, category) }
      it{ should_not be_able_to(:manage, category) }      

      it{ should be_able_to(:read, post) }

      #For Posts
      it "should be able to manage a post they own" do
        post.user_id = user.id
        should be_able_to(:manage, post)
      end

      it "should not be able to manage a post they do not own" do
        
        post.user_id = user2.id
        should_not be_able_to(:manage, post)
      end

      #For Comments
      it{ should be_able_to(:read, comment) }
      
       it "should be able to manage a comment they own" do
        comment.user_id = user.id
        should be_able_to(:manage, comment)
      end

       it "should not be able to manage a comment they do not own" do
        
        comment.user_id = user2.id
        should_not be_able_to(:manage, comment)
      end

      #For Projects
      it{ should be_able_to(:read, project) }
      
      it "should be able to manage a project they own" do
        project.user_id = user.id
        should be_able_to(:manage, project) 
      end 

      it "should not be able to manage a project they do not own" do
        
        project.user_id = user2.id
        should_not be_able_to(:manage, project)
      end

    end    

    context "when tech manager" do
      
      let(:user){ FactoryGirl.create(:tech_manager) }     

      #For Categories
      it{ should be_able_to(:read, category) }
      it{ should be_able_to(:manage, category) }      

      #For Posts
      it{ should be_able_to(:read, post) }

      it "should be able to manage a post they own" do
        post.user_id = user.id
        should be_able_to(:manage, post)
      end

      it "should be able to manage a post they do not own" do
        
        post.user_id = user2.id
        should be_able_to(:manage, post)
      end

      #For Comments
      it{ should be_able_to(:read, comment) }
      
       it "should be able to manage a comment they own" do
        comment.user_id = user.id
        should be_able_to(:manage, comment)
      end

       it "should be able to manage a comment they do not own" do
        comment.user_id = user2.id
        should be_able_to(:manage, comment)
      end

      #For Projects
      it{ should be_able_to(:read, project) }
      
      it "should be able to manage a project they own" do
        project.user_id = user.id
        should be_able_to(:manage, project) 
      end

      it "should be able to manage a project they do not own" do
        
        project.user_id = user2.id
        should be_able_to(:manage, project)
      end 

    end   

    context "when superuser" do
      
      let(:user){ FactoryGirl.create(:superuser) }

      it{ should be_able_to(:manage, category) }
      it{ should be_able_to(:manage, post) }
      it{ should be_able_to(:manage, project) } 
      it{ should be_able_to(:manage, comment) } 

    end    


  end
end
