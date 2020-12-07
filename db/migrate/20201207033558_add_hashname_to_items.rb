class AddHashnameToItems < ActiveRecord::Migration[6.0]
  def change
    add_column :items, :hashname, :string
  end
end
