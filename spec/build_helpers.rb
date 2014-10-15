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
    @spot = UserSkateSpot.create(user_id: 1,
                                 name: "Turing Shred",
                                 address: "123 Right Here St.",
                                 city:  "Denver",
                                 state: "CO",
                                 zipcode: "80232",
                                 latitude:  31.43567976,
                                 longitude: -104.897738,
                                 approval: true)
  end

  def denied_user_spot
    @spot = UserSkateSpot.create(user_id: 1,
                                 name: "Turing Shred",
                                 address: "123 Right Here St.",
                                 city:  "Denver",
                                 state: "CO",
                                 zipcode: "80232",
                                 latitude:  31.43567976,
                                 longitude: -104.897738,
                                 approval: false)
  end
  
  def park
    @park = SkateSpot.create(name: "Skate Down",
                             address: "123 Right There St.",
                             city: "Denver",
                             state: "CO",
                             zipcode: "80232",
                             latitude:  31.43567976,
                             longitude: -104.897738)
  end
end