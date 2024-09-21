class CreateUserGengos < ActiveRecord::Migration[6.1]
  def change
    create_table :user_gengos do |t|
      t.references :user, null: false, foreign_key: true
      t.references :gengo, null: false, foreign_key: true

      t.timestamps
    end
  end
end
