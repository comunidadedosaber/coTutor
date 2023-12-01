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
        #redirect_to projects_suggestions_path, notice: 'Suggestion was successfully created.'
        redirect_to "/projects/#{suggestion_params["project_id"]}", notice: 'Suggestion was successfully add.'
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
        redirect_to projects_suggestions_path, notice: 'Suggestion was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @suggestion = ProjectsSuggestion.find(params[:id])
      @suggestion.destroy
      redirect_to projects_suggestions_path, notice: 'Suggestion was successfully destroyed.'
    end
  
    private

    def set_suggestion
      @suggestion = ProjectsSuggestion.find(params[:id])
    end
  
    def suggestion_params
      params.require(:projects_suggestion).permit(:user_id, :project_id, :project_type, :suggestion)
    end
  end
  