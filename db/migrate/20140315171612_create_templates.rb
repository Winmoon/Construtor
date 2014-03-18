class CreateTemplates < ActiveRecord::Migration
  def up
    create_table :templates do |t|
      t.references :template_category, index: true
      t.string :name
      t.string :path

      t.timestamps
    end
  end

  def down
    drop_table :templates
  end
end
