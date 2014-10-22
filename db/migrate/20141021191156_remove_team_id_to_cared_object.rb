class RemoveTeamIdToCaredObject < ActiveRecord::Migration
  def change
    remove_reference :cared_objects, :team, index: true
  end
end
