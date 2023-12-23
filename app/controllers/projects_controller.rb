class ProjectsController < ApplicationController
    def index
      @projects = Project.all
    end    

    def show
      @project = Project.find(params["id"])
      @user = User.find(1)
      return render "show"
    end
  
    def new
      @project = Project.new
    end
  
    def create
      @project = Project.new(project_params)      
      if @project.save
        project_id = @project.id
        member_params = {}
        member_params["project_id"] = @project.id
        member_params["user_id"] = current_user.id
        member_params["perfil_type"] = "Autor"
        @member = ProjectsMember.new(member_params)
        @member.save        
        redirect_to "/#{current_user.id}/dashboard"
      else
        render :new
      end
    end
  
    def edit
      @project = Project.find(params[:id])
      if @project.state == "Analisando"
        render :edit
      else
        redirect_to "/projects/#{@project.id}"
      end
    end
  
    def update
      @project = Project.find(params[:id])
      if @project.state == "Analisando"
        if @project.update(project_params)
          redirect_to "/projects/#{params[:id]}"
        else
          render :edit
        end
      else
        redirect_to "/projects/#{@project.id}"
      end
    end
  
    def destroy
      @project = Project.find(params[:id])
      if @project.state == "Analisando"
        @project.destroy
        redirect_to "/projects/#{@project.id}"
      else
        redirect_to "/projects/#{@project.id}"
      end
    end  
    
    def preview
      @project = Project.find(params["id"])      
      if @project.state == "Analisando"
        redirect_to "/projects/#{@project.id}"
      else
        @monograph = @project.projects_monograph.where(state: ["Aprovado"])[0]      
        if @monograph.present? 
          @user = User.find(current_user.id)
          return render "/projects/preview"      
        else   
          redirect_to "/projects/#{@project.id}"
        end
      end
    end

    def index_members
      @project = Project.find(params[:id])
      @project_members = @project.projects_member
      return render "/projects/members/_show_member"
    end 

    def create_member
      @project = Project.find(params[:id])
      @users = User.all
      return render "/projects/members/_add_member"
    end 

    def index_boards
      @project = Project.find(params[:id])
      @project_boards = @project.projects_board
      return render "/projects/members/_show_board"
    end 

    def create_board
      @project = Project.find(params[:id])
      @users = User.all
      return render "/projects/members/_add_board"
    end 

    def index_keywords
      @project = Project.find(params[:id])
      @project_keywords = @project.projects_keyword
      return render "/projects/descriptions/_show_keyword"
    end 
    
    def create_keyword
      @project = Project.find(params[:id])
      return render "/projects/descriptions/_add_keyword"
    end 

    def index_suggestions
      @project = Project.find(params[:id])
      @project_suggestions = @project.projects_suggestion
      return render "/projects/descriptions/_show_suggestion"
    end 

    def create_suggestion
      @project = Project.find(params[:id])
      return render "/projects/descriptions/_add_suggestion"
    end 

    def index_archives
      @project = Project.find(params[:id])
      @project_archives = @project.projects_archive
      return render "/projects/descriptions/_show_archive"
    end 

    def create_archive
      @project = Project.find(params[:id])
      return render "/projects/descriptions/_add_archive"
    end 

    def index_proposals
      @project = Project.find(params[:id])
      @project_proposals = @project.projects_proposal
      return render "/projects/phases/_show_proposal"
    end 

    def create_proposal
      @project = Project.find(params[:id])
      return render "/projects/phases/_add_proposal"
    end
  
    def index_drafts
      @project = Project.find(params[:id])
      @project_drafts = @project.projects_draft
      return render "/projects/phases/_show_draft"
    end 

    def create_draft
      @project = Project.find(params[:id])
      return render "/projects/phases/_add_draft"
    end 
    
    def index_monographs
      @project = Project.find(params[:id])
      @project_monographs = @project.projects_monograph
      return render "/projects/phases/_show_monograph"
    end 

    def create_monograph
      @project = Project.find(params[:id])
      return render "/projects/phases/_add_monograph"
    end   
  
    private

    def set_project
      @project = Project.find(params[:id])
    end
  
    def project_params
      params.require(:project).permit(:title, :project_type, :department, :area, :course, :category, :description, :state, :lective_year)
    end
  end
  