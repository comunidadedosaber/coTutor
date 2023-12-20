class ProjectsSuggestionsController < ApplicationController
    def index
      @suggestions = ProjectsSuggestion.all
    end

    def show
      @suggestion = ProjectsSuggestion.find(params["id"])
      return render "show"
    end
  
    def new
      @suggestion = ProjectsSuggestion.new
    end
  
    def create
      @suggestion = ProjectsSuggestion.new(suggestion_params)
      if @suggestion.save
        redirect_to "/projects/#{suggestion_params["project_id"]}"
      else
        render :new
      end            
    end
  
    def edit
      @suggestion = ProjectsSuggestion.find(params[:id])
    end
  
    def update
      @suggestion = ProjectsSuggestion.find(params[:id])
      if @suggestion.update(suggestion_params)
        redirect_to projects_suggestions_path
      else
        render :edit
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
  