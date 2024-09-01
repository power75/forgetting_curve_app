class LearningHistoriesController < ApplicationController
  include LearningStatus

  def new
    @learning_history = LearningHistory.new
    @learning_history.build_quiz
  end

  def index
    @q = current_user.learning_histories.ransack(params[:q])
    @learning_histories = @q.result(distinct: true).includes(:quiz).all.order(created_at: :desc)
  end

  def create
    @learning_history = current_user.learning_histories.build(learning_history_params)
    @learning_history.quiz.user = current_user if @learning_history.quiz.present? # quizにはuser_idが必要なのでcurrent_userを渡す。
    tag_names = params[:learning_history][:tags].split(',') # tag_namesにtagを代入する。カンマで区切る。
    if @learning_history.save
      tag_names.each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name.strip) # tagがなかったら新しく作ってtagに代入する。
        @learning_history.tags << tag
      end
      redirect_to(learning_histories_path, success: 'create successful')
    else
      flash.now[:danger] = 'create failed'
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @learning_history = current_user.learning_histories.includes(:quiz).find(params[:id])
    @learning_history.quiz.user = current_user if @learning_history.quiz.present?
  end

  def update
    @learning_history = current_user.learning_histories.includes(:quiz).find(params[:id])
    @learning_history.quiz.user = current_user if @learning_history.quiz.present?
    @learning_history.tags.clear
    tag_names = params[:learning_history][:tag].split(',')
    if @learning_history.update(learning_history_params)
      tag_names.each do |tag_name|
        tag = Tag.find_or_create_by(name: tag_name.strip)
        @learning_history.tags << tag unless @learning_history.tags.include?(tag)
      end
      redirect_to learning_histories_path, success: 'update success'
    else
      flash.now[:danger] = 'update failed'
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    learning_history = current_user.learning_histories.includes(:quiz).find(params[:id])
    learning_history.destroy!
    redirect_to learning_histories_path, success: 'deleted!', status: :see_other
  end

  def show
    @learning_history =  current_user.learning_histories.includes(:quiz).find(params[:id])
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
      quiz_attributes: [:title, :content, :sample_answer, :id]
      )
    end
end
