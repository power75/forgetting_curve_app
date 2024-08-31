class LearningHistoryTagRelation < ApplicationRecord
  belongs_to :learning_history
  belongs_to :tag
end
