class QuizzesController < ApplicationController
  include LearningStatus

  def new
  end

  def index
    @q = current_user.quizzes.ransack(params[:q])
    @quizzes = @q.result(distinct: true).includes(:learning_history).all.order(created_at: :desc) # includesで親モデルのLearning_historyも一緒に取得
  end

  def create
    @quiz = current_user.quizzes.includes(:learning_history).find(params[:id])
  end

  def show
    @quiz = current_user.quizzes.includes(:learning_history).find(params[:id])
  end

  def edit
    @quiz = current_user.quizzes.includes(:learning_history).find(params[:id])
  end

  def update
    @quiz = current_user.quizzes.includes(:learning_history).find(params[:id])
    if @quiz.update(quiz_params)
      redirect_to quiz_path, success: 'answered!'
    else
      flash.now[:danger] = 'update failed'
      render :edit, status: :unprocessable_entity
    end
  end

  private
    def quiz_params
      params.require(:quiz).permit(:user_answer)
    end
end
