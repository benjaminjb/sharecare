class AddTeamIdToCaredObject < ActiveRecord::Migration
  def change
    add_reference :cared_objects, :team, index: true
  end
end
