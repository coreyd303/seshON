class CreateSkateSpots < ActiveRecord::Migration
  def change
    create_table :skate_spots do |t|
      t.string   :name
      t.string   :address
      t.string   :city
      t.string   :state
      t.string   :zipcode
      t.float    :latitude
      t.float    :longitude
      t.string   :image_url
      t.timestamps
    end
  end
end
