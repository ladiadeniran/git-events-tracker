class CreateActors < ActiveRecord::Migration
  def up
    create_table :actors, id: false do |t|
      t.bigint :id, options: 'PRIMARY KEY'
      t.string :login, index: { unique: true }, null: false
      t.string :avatar_url
    end
  end

  def down
    drop_table :actors
  end
end
