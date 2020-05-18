class TodosController < ApplicationController
  def index
    #fetch all the todos
    @todos = Todo.all
  end

  def show
    #to show a todo
    @todo = Todo.find(params[:id])
  end

  def new
    #renders form new todos
    @todo = Todo.new
  end


  def create
    #create a new todo 
    @todo = Todo.create(todo_params)
    redirect_to @todo
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    #update an existing todo
    @todo = Todo.find(params[:id])
    @todo.update todo_params
    redirect_to @todo
  end

  def destroy
    #destory an existing todo
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to root_path
  end

  private
  def todo_params
    params.require(:todo).permit(:title, :note, :deadline)
  end
end
