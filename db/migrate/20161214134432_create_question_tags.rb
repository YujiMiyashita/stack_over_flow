class CreateQuestionTags < ActiveRecord::Migration
  def change
    create_table :question_tags do |t|
      t.references :question, index: true, foreign_key: true, null: false
      t.references :tag, index: true, foreign_key: true, null: false

      t.timestamps null: false
    end
  end
end
