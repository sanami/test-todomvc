class TodosController < ApplicationController
  # GET /todos
  # GET /todos.json
  def index
    if params[:since].present?
      since = Time.zone.parse(params[:since])
      @todos = Todo.with_deleted.where("updated_at > ? OR deleted_at > ?", since, since)
    else
      @todos = Todo.all
    end
    render json: {todos: @todos, since: Time.now}
  end

  # GET /todos/1
  # GET /todos/1.json
  def show
    @todo = Todo.find(params[:id])

    render json: @todo
  end

  # POST /todos
  # POST /todos.json
  def create
    @todo = Todo.new(params[:todo])
    if @todo.save
      render json: @todo, status: :created, location: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    @todo = Todo.find(params[:id])

    if @todo.update_attributes(params[:todo])
      head :no_content
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    head :no_content
  end
end
