class ProjectsArchivesController < ApplicationController
    def index
      @archives = ProjectsArchive.all
    end

    def show
      @archive = ProjectsArchive.find(params["id"])
      return render "show"
    end
  
    def new
      @archive = ProjectsArchive.new
    end
  
    def create
      @archive = ProjectsArchive.new(archive_params)
      if @archive.save
        redirect_to "/projects/#{archive_params["project_id"]}"
      else
        render :new
      end
    end
  
    def edit
      @archive = ProjectsArchive.find(params[:id])
    end
  
    def update
      @archive = ProjectsArchive.find(params[:id])
      if @archive.update(archive_params)
        redirect_to projects_archives_path
      else
        render :edit
      end
    end
  
    def destroy
      @archive = ProjectsArchive.find(params[:id])
      if @archive.project.state == "Analisando"
        @archive.destroy
        redirect_to "/projects/#{@archive.project.id}"
      else
        redirect_to "/projects/#{@archive.project.id}"
      end
    end
  
    private

    def set_archive
      @archive = ProjectsArchive.find(params[:id])
    end
  
    def archive_params
      params.require(:projects_archive).permit(:user_id, :project_id, :archive, :description, :project_type)
    end
  end
  