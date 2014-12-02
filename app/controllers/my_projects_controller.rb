class MyProjectsController < ApplicationController
    before_action :set_user

    def index
        @projects = Project.user_projects( @user.id )
    end

    def show_project
        @project = Project.user_projects( @user.id ).find(params[:id])
    end

    private 
        def set_user
            @user = User.find_by_id(1)
        end
end
