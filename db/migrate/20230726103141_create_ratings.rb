class CreateRatings < ActiveRecord::Migration[7.0]
  def change
    create_table :ratings do |t|
      t.references :movie, null: false, foreign_key: true
      t.string :user
      t.integer :value, null: false

      t.timestamps
    end
  end
end
