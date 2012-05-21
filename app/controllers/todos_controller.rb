class TodosController < ApplicationController
  
  def index
    @todos = Todo.order("position ASC")
  end
  
  def create
    @todo = Todo.new(params[:todo])
    if @todo.save
      redirect_to todos_path, :notice =>"New todo added!"
    else
      redirect_to todos_path, :notice => "Error adding todo!"
    end
  end
  
  def update
    todo = Todo.find(params[:todo][:id])
    todo.complete = params[:todo][:complete]
    todo.save
    render :nothing => true
  end
  
  def sort
    if params['todo']
      @todos = Todo.all
      @todos.each do |todo|
        todo.position = params['todo'].index(todo.id.to_s)+1
        todo.save
      end
    end
    render :nothing => true
  end
  
end
