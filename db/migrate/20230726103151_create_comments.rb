class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.references :movie, null: false, foreign_key: true
      t.string :user
      t.text :text, null: false

      t.timestamps
    end
  end
end
