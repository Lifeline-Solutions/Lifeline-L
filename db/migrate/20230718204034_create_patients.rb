class CreatePatients < ActiveRecord::Migration[7.0]
  def change
    create_table :patients do |t|
      t.string :gender
      t.string :marital_status
      t.integer :phone_number
      t.string :residence
      t.string :photo
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
