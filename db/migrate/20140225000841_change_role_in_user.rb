class ChangeRoleInUser < ActiveRecord::Migration
  def up
	change_column :users, :role, :string, :default => "default_user"  	
  end

  def down
	change_column :users, :role, :string, :default => "user"  	
  end
end
