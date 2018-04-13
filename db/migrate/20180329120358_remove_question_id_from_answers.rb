class RemoveQuestionIdFromAnswers < ActiveRecord::Migration[5.1]
  def change
    remove_column :answers, :question_id, :bigint
  end
end
