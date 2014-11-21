class Project < ActiveRecord::Base
  has_many  :user_project
  
  validates_presence_of :name

  def add_collaborator(user)
     up = UserProject.new
     up.user= user
     up.project=self
     self.user_project.push up
  end

  def collaborators
    self.user_project.map{ |up| up.user }
  end

  
end
