
class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /todos
  # GET /todos.json
  def index

    @todos = Todo.all

    render json: @todos
  end

  # GET /todos/1
  # GET /todos/1.json
  def show

    if params[:id]
      @todo=Todo.find(params[:id])
    end
    render json: @todo ,status:200
  end

  # POST /todos
  # POST /todos.json
  def create

    @todo = Todo.new(todo_params)

    if @todo.save
      render json: @todo, status: :created, location:@todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /todos/1
  # PATCH/PUT /todos/1.json
  def update
    if @todo.update(todo_params)
      head :no_content
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  # DELETE /todos/1
  # DELETE /todos/1.json
  def destroy
    @todo.destroy

    head :no_content
  end

  private

  def set_todo
    @todo = Todo.find(params[:id])
  end

  def todo_params

    params.permit(:name,:date)
  end
end
