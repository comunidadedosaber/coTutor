class ProjectsKeywordsController < ApplicationController
    def index
      @keywords = ProjectsKeyword.all
    end

    def show
      @keyword = ProjectsKeyword.find(params["id"])
      return render "show"
    end
  
    def new
      @keyword = ProjectsKeyword.new
    end
  
    def create
      @keyword = ProjectsKeyword.new(keyword_params)
      if @keyword.save
        redirect_to "/projects/#{keyword_params["project_id"]}"
      else
        render :new
      end
    end
  
    def edit
      @keyword = ProjectsKeyword.find(params[:id])
    end
  
    def update
      @keyword = ProjectsKeyword.find(params[:id])
      if @keyword.update(keyword_params)
        redirect_to projects_keywords_path
      else
        render :edit
      end
    end
  
    def destroy
      @keyword = ProjectsKeyword.find(params[:id])
      if @keyword.project.state == "Analisando"
        @keyword.destroy
        redirect_to "/projects/#{@keyword.project.id}"
      else
        redirect_to "/projects/#{@keyword.project.id}"
      end
    end
  
    private

    def set_keyword
      @keyword = ProjectsKeyword.find(params[:id])
    end
  
    def keyword_params
      params.require(:projects_keyword).permit(:project_id, :keyword)
    end
  end
  