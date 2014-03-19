class AddPageToContent < ActiveRecord::Migration
  def up
    add_column :contents, :page, :string
  end

  def down
    remove_column :contents, :page
  end
end
