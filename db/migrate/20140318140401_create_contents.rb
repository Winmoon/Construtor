class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.references :site, index: true
      t.references :template, index: true
      t.string :target
      t.text :content

      t.timestamps
    end
  end
end
