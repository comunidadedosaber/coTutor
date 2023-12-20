class ProjectsBoardsController < ApplicationController
    def index
      @boards = ProjectsBoard.all
    end  

    def show
      @board = ProjectsBoard.find(params["id"])
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
        redirect_to "/project/#{board_params["project_id"]}/boards/new", alert: 'O usuário já esta associado ao project.'
      else
        @board = ProjectsBoard.new(board_params)        
        if @board.save
          redirect_to "/projects/#{board_params["project_id"]}"
        else
          render :new
        end
      end
    end
  
    def edit
      @board = ProjectsBoard.find(params[:id])
    end
  
    def update
      @board = ProjectsBoard.find(params[:id])
      if @board.update(board_params)
        redirect_to projects_boards_path
      else
        render :edit
      end
    end
  
    def destroy
      @board = ProjectsBoard.find(params[:id])
      @board.destroy
      redirect_to "/projects/#{@board.project.id}"
    end
  
    private

    def set_board
      @board = ProjectsBoard.find(params[:id])
    end
  
    def board_params
      params.require(:projects_board).permit(:user_id, :project_id, :perfil_type)
    end
  end
  