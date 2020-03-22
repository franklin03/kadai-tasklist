class UtasksController < ApplicationController
  before_action :require_user_logged_in

  def create
    @utask = current_user.utasks.build(micropost_params)
    if @utask.save
      flash[:success] = 'taskの作成に成功しました。yon'
      redirect_to root_url
    else
      @utasks = current_user.utasks.order(id: :desc).page(params[:page])
      flash.now[:danger] = 'taskの作成に失敗しました。'
      # render 'toppages/index'
    end
  end

  def destroy
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content, :status)
  end
end