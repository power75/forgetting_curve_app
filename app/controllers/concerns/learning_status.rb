module LearningStatus
  extend ActiveSupport::Concern

def complete # 学習完了にするボタン
  @learning_history = current_user.learning_histories.find(params[:id])
  @learning_history.update(status: 1)
  redirect_to learning_histories_path, success: '完了にしました！'
end

def incomplete # 学習未完了に戻すボタン
  @learning_history = current_user.learning_histories.find(params[:id])
  @learning_history.update(status: 0)
  redirect_to learning_histories_path, success: '未完了に戻しました！'
end

end
