class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :type, comment: 'STI'
      t.string :username
      t.string :password_digest
      t.string :phone
      t.string :state

      t.datetime :last_login_at
      t.datetime :deleted_at
      t.timestamps

      t.index :username, unique: true
      t.index :phone, unique: true
      t.index :created_at
    end
  end
end
