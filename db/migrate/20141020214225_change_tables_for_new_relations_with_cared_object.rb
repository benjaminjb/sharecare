class ChangeTablesForNewRelationsWithCaredObject < ActiveRecord::Migration
  def change
    remove_column :notes, :team_id
    add_reference :notes, :cared_object, index: true

    remove_column :tasks, :team_id
    add_reference :tasks, :cared_object, index: true
    add_reference :tasks, :claimed, references: :users

    remove_column :teams, :name
    add_reference :teams, :cared_object, index: true
  end
end
