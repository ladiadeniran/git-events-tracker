class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events, id: false do |t|
      t.primary_key :id
      t.string :type
      t.datetime :created_at
      t.integer :actor_id, foreign_key: true
      t.integer :repo_id, foreign_key: true
    end
  end

  def down
    drop_table :events
  end
end
