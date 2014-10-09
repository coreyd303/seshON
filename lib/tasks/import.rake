require 'csv'

desc "Import skateparks from csv file"
task :import => [:environment] do

  file = "db/skateparks.csv"

  CSV.foreach(file, :headers => true) do |row|
    SkateSpot.create ({
      :name      => row[1],
      :address   => row[2],
      :city      => row[3],
      :state     => row[4],
      :zipcode   => row[5],
      :latitude  => row[6],
      :longitude => row[7],
      :image_url => row[8]
    })
  end
end