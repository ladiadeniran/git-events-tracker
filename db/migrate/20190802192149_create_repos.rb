class CreateRepos < ActiveRecord::Migration
  def up
    create_table :repos, id: false do |t|
      t.bigint :id, options: 'PRIMARY KEY'
      t.string :name
      t.string :url
    end
  end

  def down
    drop_table :repos
  end
end
