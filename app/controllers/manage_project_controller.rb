class ManageProjectController < ApplicationController
  
  def index 
    user = nil
    @projects = Project.user_projects( user )
  end
  
end
