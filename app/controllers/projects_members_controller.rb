class ProjectsMembersController < ApplicationController
    def index
      @members = ProjectsMember.all
    end  

    def show
      @member = ProjectsMember.find(params["id"])
      return render "show"
    end
  
    def new
      @member = ProjectsMember.new
    end
  
    def create
      @member = ProjectsMember.new(member_params)
      if @member.save
        # redirect_to projects_members_path, notice: 'Member was successfully created.'
        redirect_to "/projects/#{member_params["project_id"]}", notice: 'Member was successfully add.'
      else
        render :new
      end
    end
  
    def edit
      @member = ProjectsMember.find(params[:id])
    end
  
    def update
      @member = ProjectsMember.find(params[:id])
      if @member.update(member_params)
        redirect_to projects_members_path, notice: 'Member was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @member = ProjectsMember.find(params[:id])
      @member.destroy
      redirect_to projects_members_path, notice: 'Member was successfully destroyed.'
    end

  
    private

    def set_meber
      @member = ProjectsMember.find(params[:id])
    end
  
    def member_params
      params.require(:projects_member).permit(:user_id, :project_id, :perfil_type)
    end
  end
  