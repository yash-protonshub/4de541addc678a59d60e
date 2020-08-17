class CreateAnswers < ActiveRecord::Migration[6.0]
  def change
    create_table :answers do |t|
      t.bigint :question_id
      t.bigint :user_id
      t.text :body

      t.timestamps
    end
  end
end
