class AddPagesToTemplate < ActiveRecord::Migration
  def up
    add_column :templates, :pages, :string
  end

  def down
    remove_column :templates, :pages
  end
end
