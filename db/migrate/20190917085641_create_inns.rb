class CreateInns < ActiveRecord::Migration[6.0]
  def change
    create_table :inns do |t|
      t.references :user, foreign_key: true
      t.string :name

      t.integer :rooms_count, default: 0

      t.decimal :longitude, precision: 9, scale: 6
      t.decimal :latitude, precision: 9, scale: 6

      t.datetime :deleted_at
      t.timestamps

      t.index :name, unique: true
      t.index :created_at
    end
  end
end
