class Users < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :institution
      t.string :type, null: true
      t.string :email
      t.timestamp :email_verified_at, null: true
      t.string :password
      t.string :remember_token
      t.timestamps
    end

    add_index :users, :email, unique: true
  end
end
