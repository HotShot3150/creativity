class Ability
  include CanCan::Ability

  # For Reference:
  #
  # https://github.com/ryanb/cancan/wiki/Action-Aliases
  # CanCan Abilities Action Aliases
  # alias_action :index, :show, :to => :read
  # alias_action :new, :to => :create
  # alias_action :edit, :to => :update
  #
  # List of roles from the User model:
  # ROLES = %w[superuser tech_manager deployment_manager ldp_manager executive gl_intern]
  
  def initialize(user)
    @user = user || User.new # for guest

    ######################################################################
    # GUEST - role is NULL ---> Guest, not logged in 
    if @user.role.nil? 
      can :read, Category
      can :read, Post   
    else
     send(@user.role.to_sym)  
    end
    # END GUEST
    ######################################################################
  end


  ######################################################################
  # USER  ---> Someone has registered and is logged in
  def user
    #can :read, Post
    can :read, Category
    can :read, Post 
    can :manage, Post, user_id: @user.id  
  end  

  ######################################################################  
  # tech_manager ---> Admin power permissions to edit content etc.   
  def tech_manager 
    user
    can :manage, Category
    can :manage, Post
    
  end
  

  ######################################################################  
  # superuser
  def superuser
    can :manage, :all
  end
end