class CreateSceneries < ActiveRecord::Migration[6.0]
  def change
    create_table :sceneries do |t|
      t.string :name
      t.text :description
      t.integer :score

      t.decimal :longitude, precision: 9, scale: 6
      t.decimal :latitude, precision: 9, scale: 6
    end
  end
end
