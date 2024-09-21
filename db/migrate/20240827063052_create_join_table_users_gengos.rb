class CreateJoinTableUsersGengos < ActiveRecord::Migration[6.1]
  def change
    create_join_table :users, :gengos do |t|
      # t.index [:user_id, :gengo_id]
      # t.index [:gengo_id, :user_id]
    end
  end
end
