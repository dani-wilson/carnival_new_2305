class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :revenue

  def initialize(ride_hash)
    @name = ride_hash[:name]
    @min_height = ride_hash[:min_height]
    @admission_fee = ride_hash[:admission_fee]
    @excitement = ride_hash[:excitement]
    @revenue = 0
  end
end