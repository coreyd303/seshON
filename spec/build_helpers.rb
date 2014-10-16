module Builders

  def user_spot_attributes
    @attributes = {user_id: 1,
                   name: "Turing Shred",
                   address: "123 Right Here St.",
                   city:  "Denver",
                   state: "CO",
                   zipcode: "80232",
                   latitude:  31.43567976,
                   longitude: -104.897738,
                   approval: true}
  end

  def approved_user_spot
    @approved_spot = UserSkateSpot.create(user_id: 1,
                         name: "Turing approved",
                         address: "123 Right Here St.",
                         city:  "Denver",
                         state: "CO",
                         zipcode: "80232",
                         latitude:  31.43567976,
                         longitude: -104.897738,
                         approval: true)
  end

  def denied_user_spot
    UserSkateSpot.create(user_id: 1,
                         name: "Turing denied",
                         address: "123 Right Here St.",
                         city:  "Denver",
                         state: "CO",
                         zipcode: "80232",
                         latitude:  31.43567976,
                         longitude: -104.897738,
                         approval: false)
  end
  
  def skate_park
    SkateSpot.create(name: "Skate Down",
                     address: "123 Right There St.",
                     city: "Denver",
                     state: "CO",
                     zipcode: "80232",
                     latitude:  31.43567976,
                     longitude: -104.897738)
  end

  def skate_parks
    5.times do
      skate_park
    end
    
    @parks = SkateSpot.all
    @park  = SkateSpot.first
  end
end