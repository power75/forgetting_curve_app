# frozen_string_literal: true

class QuizzesController < ApplicationController
  include LearningStatus

  def new; end

  def index
    @q = current_user.quizzes.ransack(params[:q])
    @quizzes = @q.result(distinct: true).includes(:learning_history).all.order(created_at: :desc)
    # includesで親モデルのLearning_historyも一緒に取得
  end

  def create
    @quiz = set_quiz
  end

  def show
    @quiz = set_quiz
  end

  def edit
    @quiz = set_quiz
  end

  def update
    @quiz = set_quiz
    if @quiz.update(quiz_params)
      increment_learning_history_count
      @quiz.learning_history.save
      redirect_to quiz_path, success: '回答を記録しました'
    else
      flash.now[:danger] = '回答に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def quiz_params
    params.require(:quiz).permit(:user_answer)
  end

  def set_quiz
    current_user.quizzes.includes(:learning_history).find(params[:id])
  end

  def increment_learning_history_count
    @quiz.learning_history.increment_count
  end
end
