class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.references :user_id
      t.string :name
      t.string :role

      t.timestamps
    end
  end
end
