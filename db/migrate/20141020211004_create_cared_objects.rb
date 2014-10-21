class CreateCaredObjects < ActiveRecord::Migration
  def change
    create_table :cared_objects do |t|
      t.string :name

      t.timestamps
    end
  end
end