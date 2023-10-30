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
      @board = ProjectsBoard.new(board_params)
      if @board.save
        redirect_to projects_boards_path, notice: 'Board was successfully created.'
      else
        render :new
      end
    end
  
    def edit
      @board = ProjectsBoard.find(params[:id])
    end
  
    def update
      @board = ProjectsBoard.find(params[:id])
      if @board.update(board_params)
        redirect_to projects_boards_path, notice: 'Board was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @board = ProjectsBoard.find(params[:id])
      @board.destroy
      redirect_to projects_boards_path, notice: 'Board was successfully destroyed.'
    end
  
    private

    def set_board
      @board = ProjectsBoard.find(params[:id])
    end
  
    def board_params
      params.require(:projects_board).permit(:user_id, :project_id, :perfil_type)
    end
  end
  