# frozen_string_literal: true

class LearningHistoriesController < ApplicationController
  include LearningStatus
  before_action :set_learning_history, only: %i[edit update show]

  def new
    @learning_history = LearningHistory.new
    @learning_history.build_quiz
  end

  def index
    @q = current_user.learning_histories.ransack(params[:q])
    @learning_histories = @q.result(distinct: true).includes(:quiz).all.order(created_at: :desc)
  end

  def create
    @learning_history = build_learning_history
    tag_names = extract_tag_names
    if @learning_history.save
      @learning_history.add_tags(tag_names)
      redirect_to(learning_histories_path, success: '学習記録を作成しました')
    else
      flash.now[:danger] = '作成に失敗しました'
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    @learning_history.tags.clear
    tag_names = extract_tag_names
    if @learning_history.update(learning_history_params)
      @learning_history.add_tags(tag_names)
      redirect_to learning_histories_path, success: '学習記録を更新しました'
    else
      flash.now[:danger] = '更新に失敗しました'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    learning_history = current_user.learning_histories.includes(:quiz).find(params[:id])
    learning_history.destroy!
    redirect_to learning_histories_path, success: '学習記録を削除しました', status: :see_other
  end

  def show; end

  def autocomplete
    @learning_histories = current_user.learning_histories.where("title LIKE ?", "%#{params[:q]}%").limit(10)
    render json: @learning_histories.pluck(:title)
  end

  private

  def learning_history_params
    params.require(:learning_history).permit(
      :title,
      :content,
      :image,
      :image_cache,
      :hour,
      :tag_name,
      :count,
      quiz_attributes: %i[title content sample_answer id]
    )
  end

  def build_learning_history
    learning_history = current_user.learning_histories.build(learning_history_params)
    learning_history.quiz.user = current_user if learning_history.quiz.present?
    learning_history
  end

  def set_learning_history
    @learning_history = current_user.learning_histories.includes(:quiz).find(params[:id])
    # quizにはuser_idが必要なのでcurrent_userを渡す。
    @learning_history.quiz.user = current_user if @learning_history.quiz.present?
  end

  def extract_tag_names
    params[:learning_history][:tags].split(',') # tag_namesにtagを代入する。カンマで区切る。
  end
end
