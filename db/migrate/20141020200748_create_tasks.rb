class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.references :team_id
      t.text :task
      t.boolean :completed
      t.text :notes
      t.datetime :completed_at
      t.datetime :deadline
      t.references :user_id

      t.timestamps
    end
  end
end
