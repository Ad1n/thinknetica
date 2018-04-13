class AddAnswersToQuestion < ActiveRecord::Migration[5.1]
  def change
    add_reference :answers, :question, index: true
    add_foreign_key :answers, :questions
  end
end
