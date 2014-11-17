class User < ActiveRecord::Base
  
  has_many :user_project
  
  validates_presence_of :username, :password
  validates_presence_of :password_confirmation, :on =>  [ "create" , "change_password" ]
  validates :username, uniqueness: true
  validate :password_match
  
  
  attr_accessor :password_confirmation
  
  def change_password
    self.update_attributes( @password )
  end
  
  def password_match
    if ( !@password.eql?(@password_confirmation) )
      errors.add(:password_confirmation , "doesn't match") 
    end
  end
  
end
