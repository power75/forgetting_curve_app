class LearningHistoriesController < ApplicationController
  def new
    @learning_history = LearningHistory.new
    @learning_history.build_quiz
  end

  def index
    @learning_histories = LearningHistory.includes(:quiz).all
  end

  def create
    @learning_history = current_user.learning_histories.build(learning_history_params)
    @learning_history.quiz.user = current_user if @learning_history.quiz.present? # quizにはuser_idが必要なのでcurrent_userを渡す
    if @learning_history.save
      redirect_to(learning_histories_path, success: 'create successful')
    else
      flash.now[:danger] = 'create failed'
      render :new, status: :unprocessable_entity

    end
  end

  def destroy
  end

  def show
    @learning_history =  LearningHistory.includes(:quiz).find(params[:id])
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
      params.require(:learning_history).permit(
      :title,
      :content,
      :image,
      :hour,
      :count,
      quiz_attributes: [:title, :content, :sample_answer]
      )
    end
end
