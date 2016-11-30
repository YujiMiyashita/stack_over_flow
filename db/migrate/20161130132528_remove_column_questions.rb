class RemoveColumnQuestions < ActiveRecord::Migration
  def up
    remove_column :questions, :contribution
  end

  def down
    add_column :questions, :contribution, :integer
  end
end
