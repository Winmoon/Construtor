class CreateSites < ActiveRecord::Migration
  def up
    create_table :sites do |t|
      t.references :user, index: true
      t.references :template, index: true
      t.string :name
      t.string :status
      t.string :domain

      t.timestamps
    end
  end

  def down
    drop_table :sites
  end
end
