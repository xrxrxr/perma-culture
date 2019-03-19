class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :title
      t.text :description
      t.datetime :start_date
      t.datetime :end_date
      t.float :longitude
      t.float :latitude
      t.string :address

      t.timestamps
    end
  end
end
