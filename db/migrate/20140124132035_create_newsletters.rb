class CreateNewsletters < ActiveRecord::Migration
  def up
    create_table :newsletters do |t|
      t.string :email
      t.boolean :enabled, default: true

      t.timestamps
    end
  end

  def down
    drop_table :newsletters
  end
end
