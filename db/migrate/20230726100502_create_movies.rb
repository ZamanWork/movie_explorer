class CreateMovies < ActiveRecord::Migration[7.0]
  def change
    create_table :movies do |t|
      t.string :title, null: false
      t.string :release_year
      t.text :plot

      t.timestamps
    end
  end
end
