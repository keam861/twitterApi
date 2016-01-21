class CreateUsers < ActiveRecord::Migration
  def change
    create_table :twitter_users do |t|
      t.string :user
      t.timestamps null: false
    end
  end
end
