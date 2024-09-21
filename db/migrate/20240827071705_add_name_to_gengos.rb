class AddNameToGengos < ActiveRecord::Migration[6.1]
  def change
    add_column :gengos, :name, :string
  end
end
