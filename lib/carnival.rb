class Carnival
  attr_reader :duration,
              :rides

  def initialize(duration, rides)
    @duration = duration
    @rides = rides
  end

  def most_popular_ride
    popular_ride = {}
    @rides.each do |ride|
      ride_count = 0
      ride.rider_log.each do |log|
        ride_count += log[1]
      end
      popular_ride[ride] = ride_count
    end
    popular_ride.max_by {|ride, ride_count| ride_count}
  end

  def most_profitable_ride
    @rides.max_by do |ride|
      ride.revenue
    end
  end

  def total_revenue
    total_rev = 0
    @rides.each do |ride|
      total_rev += ride.revenue
    end
    return total_rev
  end
end