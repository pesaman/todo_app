class TodosController < ApplicationController
	
 def index
   @todos = Todo.all
 end

 def create
  @todo = Todo.create(todo_params)

  respond_to do |format|
    format.html { redirect_to root_path }
    format.js { }
  end
end

 def destroy
  # we need an instance variable `@todo` so we can access it in the next step!
  @todo = Todo.find(params[:id])
  @todo.destroy

  respond_to do |format|
    format.html { redirect_to root_path }
    format.js { }
  end
end

 private
   def todo_params
    params.require(:todo).permit(:description, :priority)
   end
end
