require "spec_helper.rb"

describe Project do
   
  describe "Constrains validations" do
    it { should validate_presence_of :name }
  end
  
  describe "Relational mapping" do
    it {should have_many :user_project }
  end
  
end