class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :institution
      t.string :user_type, null: true
      t.string :email
      t.timestamp :email_verified_at, null: true
      t.string :password
      t.string :remember_token
      t.timestamps
    end
  end
end
