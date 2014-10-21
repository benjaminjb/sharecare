class FixIdNames < ActiveRecord::Migration
  def change
    rename_column :teams, :user_id_id, :user_id
    rename_column :tasks, :user_id_id, :user_id
    rename_column :tasks, :team_id_id, :team_id
    rename_column :notes, :user_id_id, :user_id
    rename_column :notes, :team_id_id, :team_id
  end
end
