class RemoveBestAnswerIdFromQuestions < ActiveRecord::Migration[6.0]
  def change
    remove_column :questions, :best_answer_id
  end
end
