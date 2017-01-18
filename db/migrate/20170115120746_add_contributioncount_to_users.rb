class AddContributioncountToUsers < ActiveRecord::Migration
  def change
    add_column :users, :contribution_count, :integer
  end
end
