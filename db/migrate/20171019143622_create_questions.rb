class CreateQuestions < ActiveRecord::Migration[5.0]
  def change
    create_table :questions do |t|
      t.string :title
      t.string :body
      t.integer :author_id
      t.integer :best_answer_id

      t.timestamps
    end
  end
end
