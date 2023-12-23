class ProjectsMembersController < ApplicationController
    def index
      @members = ProjectsMember.all
    end  

    def show
      @member = ProjectsMember.find(params["id"])
      @project = Project.find(@member.project.id)
      return render "show"
    end
  
    def new
      @member = ProjectsMember.new
    end
  
    def create
      @member = ProjectsMember.all
      @member_user = @member.find_by(user_id: member_params[:user_id]) if member_params[:user_id].present?
      @member_project = @member.find_by(project_id: member_params[:project_id]) if member_params[:project_id].present?
      if @member_project.project.state == "Analisando"
        if @member_user.present? && @member_project.present?
          redirect_to "/project/#{member_params["project_id"]}/members/new"
        else
          @member = ProjectsMember.new(member_params)        
          if @member.save
            redirect_to "/projects/#{member_params["project_id"]}"
          else
            render :new
          end
        end
      else
        redirect_to "/projects/#{@member_project.project.id}"
      end
    end
  
    def edit
      @member = ProjectsMember.find(params[:id])   
      @project = Project.find(@member.project.id)
      if @member.project.state == "Analisando"
        render :edit
      else
        redirect_to "/projects/#{@member.project.id}"
      end
    end
  
    def update
      @member = ProjectsMember.find(params[:id]) 
      if @member.project.state == "Analisando"
        if @member.update(member_params)
          redirect_to "/projects/#{@member.project.id}"
        else
          render :edit
        end
      else
        redirect_to "/projects/#{@member.project.id}"
      end
    end
  
    def destroy
      @member = ProjectsMember.find(params[:id])
      if @member.project.state == "Analisando"
        if @member.perfil_type == "Autor"
          redirect_to "/projects/#{@member.project.id}"
        else
          @member.destroy
          redirect_to "/projects/#{@member.project.id}"
        end
      else
        redirect_to "/projects/#{@member.project.id}"
      end
    end

  
    private

    def set_meber
      @member = ProjectsMember.find(params[:id])
    end
  
    def member_params
      params.require(:projects_member).permit(:user_id, :project_id, :perfil_type)
    end
  end
  