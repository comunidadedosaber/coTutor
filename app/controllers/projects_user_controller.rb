class ProjectsUserController < ApplicationController
      
    # PROJECTS
    def index_projects
      @user = User.find(current_user.id)
      @uers_projects_members = @user.projects_member
      @uers_projects_boards = @user.projects_board
  
      return render "/projects/_user_project"
    end 
  
    # DASHBOARD
    def dashboard    
      @user = User.find(current_user.id)
      @uers_projects_members = @user.projects_member
      @uers_projects_boards = @user.projects_board
  
      return render "/layouts/dashboard/dashboard"
    end

  end
  