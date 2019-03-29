require 'minitest/autorun'
require 'minitest/pride'
require './lib/apartment'
require './lib/renter'
require './lib/building'

class BuildingTest < Minitest::Test

  def setup
    @building = Building.new
    @a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
    @b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})
    @spencer = Renter.new("Spencer")
    @jessie = Renter.new("Jessie")
  end

  def test_it_exists
    assert_instance_of Building, @building
  end

  def test_it_has_no_units_by_default
    assert_equal @building.units, []
  end

  def test_it_can_have_units_added
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    assert_equal @building.units, [@a1, @b2]
  end

  def test_average_rent
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    assert_equal @building.average_rent, 1099.5
  end

  def test_renter_with_highest_rent
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    @b2.add_renter(@spencer)
    assert_equal @spencer, @building.renter_with_highest_rent
    @a1.add_renter(@jessie)
    assert_equal @jessie, @building.renter_with_highest_rent
  end

  def test_annual_breakdown
    @building.add_unit(@a1)
    @building.add_unit(@b2)
    @b2.add_renter(@spencer)
    assert_equal @building.annual_breakdown, {"Spencer" => 11988}
    @a1.add_renter(@jessie)
    assert_equal @building.annual_breakdown, {"Jessie" => 14400, "Spencer" => 11988}
  end

end
