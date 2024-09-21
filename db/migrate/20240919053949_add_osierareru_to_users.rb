class AddOsierareruToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :osierareru, :string
  end
end
