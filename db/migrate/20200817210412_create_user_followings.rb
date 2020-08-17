class CreateUserFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :user_followings do |t|
      t.bigint :user_id
      t.bigint :following_id
      t.timestamps
    end
  end
end
