class CreateUserSkateSpots < ActiveRecord::Migration
  def change
    create_table :user_skate_spots do |t|
      t.integer :user_id
      t.string  :name
      t.string  :address
      t.string  :city
      t.string  :state
      t.string  :zipcode
      t.float   :latitude
      t.float   :longitude
      t.string  :image
    end
  end
end
