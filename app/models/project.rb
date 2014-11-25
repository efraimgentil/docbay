class Project < ActiveRecord::Base
  has_many  :user_project
  
  validates_presence_of :name

  def add_collaborator(user)
    if( UserProject.find_by_project_id_and_user_id( self.id , user.id ).nil? )
      up = UserProject.new
      up.user= user
      up.project=self
      self.user_project.push up
    end
    raise "User already in the project"
  end

  def collaborators
    self.user_project.map{ |up| up.user }
  end



  
end
