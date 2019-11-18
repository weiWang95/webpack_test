class CreateRooms < ActiveRecord::Migration[6.0]
  def change
    create_table :rooms do |t|
      t.references :inn, foreign_key: true

      t.string :number
      t.string :state
      t.datetime :released_at

      t.decimal :size, precision: 5, scale: 1

      t.datetime :deleted_at
      t.timestamps

      t.index :released_at
      t.index [:inn_id, :number], unique: true
    end
  end
end
