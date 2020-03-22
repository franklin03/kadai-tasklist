class TasksController < ApplicationController
  def index
    
    if logged_in?
    #@tasks = Task.all
      @task = current_user.tasks.build  # form_with 用
      @tasks = current_user.tasks.order(id: :desc).page(params[:page])
      # @tasks = current_user.tasks.order(id: :desc)
    else
      redirect_to :login
    end
  end

  def show
    @task = Task.find(params[:id])
  end

  def new
    @task  = Task.new;
  end

  def create
    # @task = Task.new(task_params)
    @task = current_user.tasks.build(task_params)

    
    if @task.save
      flash[:success] = 'Taskが作成されました'
      redirect_to @task 
    else
      flash.now[:danger] = 'Taskが作成されませんでした'
      render :new
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:success] = 'Taskが更新されました'
      redirect_to @task 
    else
      flash.now[:danger] = 'Taskが更新されませんでした'
      render :new
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy;
    
    flash[:success] = 'Taskが削除されました'
    redirect_to tasks_url 
    
  end
  
  private 

  def task_params
    params.require(:task).permit(:content,:status, :user)
  end
  
end

