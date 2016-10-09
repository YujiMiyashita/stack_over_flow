class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :title
      t.text :content
      t.references :user
      t.string :image
      t.integer :contribution
      t.timestamps null: false
    end
  end
end
