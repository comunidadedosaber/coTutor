class ProjectsProposalsController < ApplicationController
    def index
      @proposals = ProjectsProposal.all
    end

    def show
      @proposal = ProjectsProposal.find(params["id"])
      return render "show"
    end
  
    def new
      @proposal = ProjectsProposal.new
    end
  
    def create
      @proposal = ProjectsProposal.where(project_id: proposal_params[:project_id], state: ["Aprovado", "Analisando"])
      
      if @proposal.present?
        @proposal.each do |proposal_project|
          if proposal_project.state == "Aprovado"
            redirect_to ("/project/#{proposal_params["project_id"]}/proposals/new"); return
          else
            if proposal_project.state == "Analisando"
              redirect_to ("/project/#{proposal_params["project_id"]}/proposals/new"); return
            else
              @proposal = ProjectsProposal.new(proposal_params)
              if @proposal.save
                redirect_to ("/projects/#{proposal_params["project_id"]}"); return
              else
                render :new
              end
            end
          end
        end
      else
        @proposal = ProjectsProposal.new(proposal_params)
        if @proposal.save
          redirect_to ("/projects/#{proposal_params["project_id"]}"); return
        else
          render :new
        end
      end
    end
  
    def edit
      @proposal = ProjectsProposal.find(params[:id])
    end
  
    def update
      @proposal = ProjectsProposal.find(params[:id])
      if @proposal.update(proposal_params)
        redirect_to projects_proposals_path
      else
        render :edit
      end
    end
  
    def destroy
      @proposal = ProjectsProposal.find(params[:id])
      @proposal.destroy
      redirect_to projects_proposals_path
    end
  
    private

    def set_proposal
      @proposal = ProjectsProposal.find(params[:id])
    end
  
    def proposal_params
      params.require(:projects_proposal).permit(:project_id, :theme, :objectives, :summary, :literature, :state)
    end
  end
  