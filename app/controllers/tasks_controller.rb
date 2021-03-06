class TasksController < ApplicationController
  before_action :set_task, only: %i[ show edit update destroy ]
  before_action :authenticate_user!, except: [:index]
  before_action :correct_user, only: [:show, :edit, :update, :destroy]
  
  # GET /tasks or /tasks.json
  def index
    if params.has_key?(:category)
      @category = Category.find_by_name(params[:category])
      @tasks = Task.where(category: @category)
    else
      @tasks = Task.all
  end

  # GET /tasks/1 or /tasks/1.json
  def show
    @task= Task.find(params[:id])

    @relative_tasks = task.where(category_id: @task.category_i)
  end

  # GET /tasks/new
  def new
    # @task = Task.new
    @task = current_user.tasks.build
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks or /tasks.json
  def create
    @task = current_user.tasks.build(task_params)

    respond_to do |format|
      if @task.save
        format.html { redirect_to task_url(@task), notice: "Task was successfully created." }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1 or /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to task_url(@task), notice: "Task was successfully updated." }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1 or /tasks/1.json
  def destroy
    @task.destroy

    respond_to do |format|
      format.html { redirect_to tasks_url, notice: "Task was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def correct_user
    @friend = current_user.tasks.find_by(id: params[:id])
    redirect_to tasks_path, notice: "Log In First" if @task.nil?
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def task_params
      params.require(:task).permit(:task_title, :date, :notes, :user_id, :category_id) 
    end
end
