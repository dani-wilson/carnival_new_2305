class Ride
  attr_reader :name,
              :min_height,
              :admission_fee,
              :excitement,
              :revenue,
              :rider_log

  def initialize(ride_hash)
    @name = ride_hash[:name]
    @min_height = ride_hash[:min_height]
    @admission_fee = ride_hash[:admission_fee]
    @excitement = ride_hash[:excitement]
    @revenue = 0
    @rider_log = {}
  end

  def board_rider(visitor)
    if !visitor.preferences.include?(@excitement) || visitor.height < @min_height
      false
    else
      visitor.spending_money = visitor.spending_money - @admission_fee
      @revenue += @admission_fee
      if @rider_log.include?(visitor)
        @rider_log[visitor] +=1
      else
        @rider_log[visitor] = 1
      end
    end
  end

end