class AddIsResolvedToQuestions < ActiveRecord::Migration[6.0]
  def change
    add_column :questions, :is_resolved, :boolean, default: false
  end
end
