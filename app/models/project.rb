class Project < ActiveRecord::Base
  scope :user_projects, -> ( user_id ) { 
    joins(:user_project).where("user_project.user_id = ?" , user_id ) 
  }

  has_many  :user_project

  validates_presence_of :name

  def add_collaborator(user)
    if( UserProject.find_by_project_id_and_user_id( self.id , user.id ).nil? )
      up = UserProject.new
      up.user= user
      up.project=self
      self.user_project.push up
      return
    end
    raise "User already in the project"
  end

  def collaborators
    self.user_project.map{ |up| up.user }
  end
  
end
