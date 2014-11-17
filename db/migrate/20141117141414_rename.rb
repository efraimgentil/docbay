class Rename < ActiveRecord::Migration
  def up
    rename_table :users_projects , :user_project
  end
  
  def down
    rename_table :user_project , :users_projects
  end
end
