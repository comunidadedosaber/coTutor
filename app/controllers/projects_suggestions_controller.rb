class ProjectsSuggestionsController < ApplicationController
    def index
      @suggestions = ProjectsSuggestion.all
    end

    def show
      @suggestion = ProjectsSuggestion.find(params["id"]) 
      @project = Project.find(@suggestion.project.id)
      return render "show"
    end
  
    def new
      @suggestion = ProjectsSuggestion.new
    end
  
    def create
      @suggestion = ProjectsSuggestion.new(suggestion_params)
      if @suggestion.project.state == "Analisando"
        if @suggestion.save
          redirect_to "/projects/#{suggestion_params["project_id"]}"
        else
          render :new
        end 
      else
        redirect_to "/projects/#{@suggestion.project.id}"
      end           
    end
  
    def edit
      @suggestion = ProjectsSuggestion.find(params[:id])    
      @project = Project.find(@suggestion.project.id)
      if @suggestion.project.state == "Analisando"
        render :edit
      else
        redirect_to "/projects/#{@suggestion.project.id}"
      end
    end
  
    def update
      @suggestion = ProjectsSuggestion.find(params[:id])
      if @suggestion.project.state == "Analisando"
        if @suggestion.update(suggestion_params)
          redirect_to "/projects/#{@suggestion.project.id}"
        else
          render :edit
        end
      else
        redirect_to "/projects/#{@suggestion.project.id}"
      end
    end
  
    def destroy
      @suggestion = ProjectsSuggestion.find(params[:id])
      if @suggestion.project.state == "Analisando"
        @suggestion.destroy
        redirect_to "/projects/#{@suggestion.project.id}"
      else
        redirect_to "/projects/#{@suggestion.project.id}"
      end
    end
  
    private

    def set_suggestion
      @suggestion = ProjectsSuggestion.find(params[:id])
    end
  
    def suggestion_params
      params.require(:projects_suggestion).permit(:user_id, :project_id, :project_type, :suggestion)
    end
  end
  