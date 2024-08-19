class QuizzesController < ApplicationController
  def index
    @quizzes = current_user.quizzes.includes(:learning_history) # includesで親モデルのLearning_historyも一緒に取得
  end
end
