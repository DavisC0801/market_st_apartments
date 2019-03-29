require './lib/apartment'

class Building

  attr_reader :units

  def initialize
     @units = []
  end

  def add_unit(unit)
    @units << unit
  end

  def average_rent
    total_rent = @units.sum{|unit| unit.monthly_rent}
    total_rent / @units.length.to_f
  end

  def renter_with_highest_rent
    max_rent = occupied.max_by{|unit| unit.monthly_rent}
    max_rent.renter
  end

  def annual_breakdown
    breakdown = {}
    occupied.each{|unit| breakdown[unit.renter.name] = unit.monthly_rent * 12}
    breakdown
  end

  def occupied
    @units.find_all{|unit| unit.renter != nil}
  end

end
