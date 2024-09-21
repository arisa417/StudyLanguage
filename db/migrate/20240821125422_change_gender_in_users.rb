class ChangeGenderInUsers < ActiveRecord::Migration[6.1]
  def up
    change_column :users, :gender, :interger, default: 0
  end

   end
