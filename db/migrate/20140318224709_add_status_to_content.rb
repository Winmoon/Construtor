class AddStatusToContent < ActiveRecord::Migration
  def up
    add_column :contents, :content_status, :string
  end

  def down
    remove_column :contents, :content_status
  end
end
