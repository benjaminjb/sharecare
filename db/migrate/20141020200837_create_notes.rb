class CreateNotes < ActiveRecord::Migration
  def change
    create_table :notes do |t|
      t.references :team_id
      t.references :user_id
      t.datetime :noted_at
      t.text :remark

      t.timestamps
    end
  end
end
