class CreateGengos < ActiveRecord::Migration[6.1]
  def change
    create_table :gengos do |t|
      t.string :wannastudy

      t.timestamps
    end
  end
end
