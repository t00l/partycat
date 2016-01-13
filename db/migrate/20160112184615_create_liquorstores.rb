class CreateLiquorstores < ActiveRecord::Migration
  def change
    create_table :liquorstores do |t|
      t.string :name
      t.string :address
      t.float :latitude
      t.float :longitude
      t.datetime :openh
      t.datetime :closeh

      t.timestamps null: false
    end
  end
end
