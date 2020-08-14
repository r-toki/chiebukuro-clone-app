class CreateBestAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :best_answers do |t|
      t.references :question, null: false, foreign_key: true, index: { unique: true }
      t.references :answer, null: false, foreign_key: true, index: { unique: true }

      t.timestamps
    end
  end
end
