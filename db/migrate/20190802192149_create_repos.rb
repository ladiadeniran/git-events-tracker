class CreateRepos < ActiveRecord::Migration
  def up
    create_table :repos, id: false do |t|
      t.primary_key :id
      t.string :name
      t.string :url
    end
  end

  def down
    drop_table :repos
  end
end
