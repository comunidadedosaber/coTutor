class ProjectsBoardsController < ApplicationController
    def index
      @boards = ProjectsBoard.all
    end  

    def show
      @board = ProjectsBoard.find(params["id"]) 
      @project = Project.find(@board.project.id)
      return render "show"
    end
  
    def new
      @board = ProjectsBoard.new
    end
  
    def create
      @board = ProjectsBoard.all
      @board_user = @board.find_by(user_id: board_params[:user_id]) if board_params[:user_id].present?
      @board_project = @board.find_by(project_id: board_params[:project_id]) if board_params[:project_id].present?            
      if @board_user.present? && @board_project.present?
        redirect_to "/project/#{board_params["project_id"]}/boards/new"
      else
        if @board_project.present?
          if @board_project.project.state == "Analisando"
            @board = ProjectsBoard.new(board_params)        
            if @board.save
              redirect_to "/projects/#{board_params["project_id"]}"
            else
              render :new
            end
          else
            redirect_to "/projects/#{@board.project.id}"
          end
        else
          @board = ProjectsBoard.new(board_params)        
          if @board.save
            redirect_to "/projects/#{board_params["project_id"]}"
          else
            render :new
          end
        end
      end
    end
  
    def edit
      @board = ProjectsBoard.find(params[:id])
      @project = Project.find(@board.project.id)
      if @board.project.state == "Analisando"
        render :edit
      else
        redirect_to "/projects/#{@board.project.id}"
      end
    end
  
    def update
      @board = ProjectsBoard.find(params[:id])
      if @board.project.state == "Analisando"
        if @board.update(board_params)
          redirect_to "/projects/#{@board.project.id}"
        else
          render :edit
        end
      else
        redirect_to "/projects/#{@board.project.id}"
      end
    end
  
    def destroy
      @board = ProjectsBoard.find(params[:id])
      if @board.project.state == "Analisando"
        @board.destroy
        redirect_to "/projects/#{@board.project.id}"
      else
        redirect_to "/projects/#{@board.project.id}"
      end
    end
  
    private

    def set_board
      @board = ProjectsBoard.find(params[:id])
    end
  
    def board_params
      params.require(:projects_board).permit(:user_id, :project_id, :perfil_type)
    end
  end
  