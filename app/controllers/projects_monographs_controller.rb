class ProjectsMonographsController < ApplicationController
    def index
      @monographs = ProjectsMonograph.all
    end

    def show
      @monograph = ProjectsMonograph.find(params["id"])
      return render "show"
    end
  
    def new
      @monograph = ProjectsMonograph.new
    end
  
    def create
      @monograph = ProjectsMonograph.where(project_id: monograph_params[:project_id], state: ["Aprovado", "Analisando"])
      
      if @monograph.present?
        @monograph.each do |monograph_project|
          if monograph_project.state == "Aprovado"
            redirect_to ("/project/#{monograph_params["project_id"]}/monographs/new"); return
          else
            if monograph_project.state == "Analisando"
              redirect_to ("/project/#{monograph_params["project_id"]}/monographs/new"); return
            else
              @monograph = ProjectsMonograph.new(monograph_params)
              if @monograph.save
                redirect_to ("/projects/#{monograph_params["project_id"]}"); return
              else
                render :new
              end
            end
          end
        end
      else
        @monograph = ProjectsMonograph.new(monograph_params)
        if @monograph.save        
          redirect_to ("/projects/#{monograph_params["project_id"]}"); return
        else
          render :new
        end
      end
    end
  
    def edit
      @monograph = ProjectsMonograph.find(params[:id])
    end
  
    def update
      @monograph = ProjectsMonograph.find(params[:id])
      if @monograph.update(monograph_params)
        redirect_to projects_monographs_path
      else
        render :edit
      end
    end
  
    def destroy
      @monograph = ProjectsMonograph.find(params[:id])
      if @monograph.state == "Analisando"
        @monograph.destroy
        redirect_to "/projects/#{@monograph.project.id}"
      else
        redirect_to "/projects/#{@monograph.project.id}"
      end
    end
  
    private

    def set_monograph
      @monograph = ProjectsMonograph.find(params[:id])
    end
  
    def monograph_params
      params.require(:projects_monograph).permit(
        :project_id, :theme, :editor, :language, :country, :type, :pages, :terms_use,
        :objective, :index, :summary, :state, :privacy, :lective_year
      )
    end
  end
  