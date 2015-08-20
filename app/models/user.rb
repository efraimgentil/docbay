class User < ActiveRecord::Base
  
  has_many :user_project
  
  validates_presence_of :username, :password
  validates_presence_of :password_confirmation, :on =>  [ "create" , "change_password" ]
  validates :username, uniqueness: true
  validate :password_match
  
  
  attr_accessor :password_confirmation, :password
  
  def change_password
    self.update_attributes( @password )
  end
  
  def password_match
    puts(" #{@password} P")
    puts(" #{@password_confirmation} PC" )
    puts( !@password.eql?(@password_confirmation) )
    if ( !@password.eql?(@password_confirmation) )
      errors.add(:password_confirmation , "doesn't match") 
    end
  end

  def self.username_like ( username )
    self.where("upper(username) LIKE upper(:username)" , username: "%#{username}%" ) 
  end

  def self.find_users_not_in_the_project ( username , project )
    self.username_like( username )
      .where("id NOT IN (?)" , (UserProject.where("project_id = ?", 1).map{ |up| up.user_id }).push(0) )
  end
  
end
