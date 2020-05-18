class TodosController < ApplicationController
  def index
    #fetch all the todos
    #first the todos should be sorted according to the deadline and for the same deadline
    #the todos should be sorted by the priority
    @todos = Todo.all.order("deadline ASC, priority DESC")
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
    @todo = Todo.new(todo_params)
    if @todo.save
      redirect_to @todo
    else
      render :new
    end
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    #update an existing todo
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
        redirect_to @todo
    else
        render :edit
    end
  end

  def destroy
    #destory an existing todo
    @todo = Todo.find(params[:id])
    @todo.destroy
    redirect_to root_path
  end

  private

  def todo_params
    params.require(:todo).permit(:title, :note, :deadline, :priority)
  end
end
