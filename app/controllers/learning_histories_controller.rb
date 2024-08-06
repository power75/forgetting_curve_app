class LearningHistoriesController < ApplicationController
  def new
  end

  def index
    @learning_histories = LearningHistory.includes(:user)
  end

  def create
  end

  def destroy
  end

  def show
  end

  def complete # 学習完了にするボタン
    @learning_history = LearningHistory.find(params[:id])
    @learning_history.update(status: 1)
    redirect_to learning_histories_path, notice: '完了にしました！'
  end

  def incomplete # 学習未完了に戻すボタン
    @learning_history = LearningHistory.find(params[:id])
    @learning_history.update(status: 0)
    redirect_to learning_histories_path, notice: '未完了に戻しました！'
  end

  private
    def learning_history_params
      params.require(:learning_history).permit(:statu, :title, :content, :image, :hour, :count)
    end
end
