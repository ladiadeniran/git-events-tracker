class CreateEvents < ActiveRecord::Migration
  def up
    create_table :events, id: false do |t|
      t.bigint :id, options: 'PRIMARY_KEY', limit: 11
      t.string :type
      t.datetime :created_at
      t.bigint :actor_id, foreign_key: true
      t.bigint :repo_id, foreign_key: true
    end
  end

  def down
    drop_table :events
  end
end
