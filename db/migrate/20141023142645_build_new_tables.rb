class BuildNewTables < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :firstname
      t.string :lastname
      t.string :phone
      t.timestamps
    end

    create_table :teams do |t|
      t.string :name
      t.timestamps
    end

    create_table :invitations do |t|
      t.string :email
      t.references :team, index: true
      t.references :user, index: true
      t.timestamps
    end

    create_table :rosters do |t|
      t.references :team, index: true
      t.references :user, index: true
      t.string :role
      t.timestamps
    end    

    create_table :tasks do |t|
      t.references :team, index: true
      t.references :user, index: true
      t.text :task
      t.boolean :completed
      t.text :notes
      t.datetime :starttime
      t.datetime :endtime
      t.datetime :completed_at
      t.timestamps
    end

    create_table :claims do |t|
      t.references :task, index: true
      t.references :user, index: true
      t.timestamps
    end

    create_table :notes do |t|
      t.references :team
      t.references :user
      t.datetime :noted_at
      t.text :remark
      t.timestamps
    end
  end
end
