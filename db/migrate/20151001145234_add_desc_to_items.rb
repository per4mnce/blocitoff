class AddDescToItems < ActiveRecord::Migration
  def change
    add_column :items, :desc, :string
  end
end
