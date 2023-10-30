class ProjectsDraftsController < ApplicationController
    def index
      @drafts = ProjectsDraft.all
    end

    def show
      @draft = ProjectsDraft.find(params["id"])
      return render "show"
    end
  
    def new
      @draft = ProjectsDraft.new
    end
  
    def create
      @draft = ProjectsDraft.new(draft_params)
      if @draft.save
        redirect_to projects_drafts_path, notice: 'Draft was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @draft = ProjectsDraft.find(params[:id])
    end
  
    def update
      @draft = ProjectsDraft.find(params[:id])
      if @draft.update(draft_params)
        redirect_to projects_drafts_path, notice: 'Draft was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @draft = ProjectsDraft.find(params[:id])
      @draft.destroy
      redirect_to projects_drafts_path, notice: 'Draft was successfully destroyed.'
    end
  
    private

    def set_draft
      @draft = ProjectsDraft.find(params[:id])
    end
  
    def draft_params
      params.require(:projects_draft).permit(
        :project_id, :theme, :introduction, :problem, :study_object, :action_field,
        :general_objective, :specific_objective, :justification, :hypothesis, :variables,
        :methodology, :search, :methods, :techniques, :structure, :references, :state
      )
    end
  end
  