class RemoveColumnAnswers < ActiveRecord::Migration
  def up
    remove_column :answers, :contribution
  end

  def down
    add_column :answers, :contribution, :integer
  end
end
