# Market Street Apartments

## Instructions

* Fork this Repository
* Clone your forked repo to your computer.
* Complete the activity below.
* Push your solution to your forked repo
* Submit a pull request from your repository to this repository
  * Put your name in your PR!

## Iteration 1

Use TDD to create a Renter class and an Apartment class that respond to the following interaction pattern:

```ruby
pry(main)> require './lib/renter'
# => true

pry(main)> require './lib/apartment'
# => true

pry(main)> jessie = Renter.new("Jessie")    
# => #<Renter:0x00007fa15c93af80...>

pry(main)> jessie.name
# => "Jessie"

pry(main)> a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})    
# => #<Apartment:0x00007fb3ecaae7c0...>

pry(main)> a1.number
# => "A1"

pry(main)> a1.monthly_rent
# => 1200

pry(main)> a1.bathrooms
# => 1

pry(main)> a1.bedrooms
# => 1

pry(main)> a1.renter
# => nil

pry(main)> a1.add_renter(jessie)

pry(main)> a1.renter
# => #<Renter:0x00007fb3ee106ce8...>
```

## Iteration 2

Use TDD to create a Building class that responds to the following interaction pattern.

```ruby
pry(main)> require './lib/renter'
# => true

pry(main)> require './lib/apartment'
# => true

pry(main)> require './lib/building'
# => true

pry(main)> building = Building.new
# => #<Building:0x00007f83778c5a80...>

pry(main)> building.units
# => []

pry(main)> a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})
# => #<Apartment:0x00007f8377209bb0...>

pry(main)> b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})    
# => #<Apartment:0x00007f83779f0900...>

pry(main)> building.add_unit(a1)    

pry(main)> building.add_unit(b2)    

pry(main)> building.units
# => [#<Apartment:0x00007f8377209bb0...>, #<Apartment:0x00007f83779f0900...>]

pry(main)> building.average_rent
# => 1099.5
```

## Iteration 3

Use TDD to update your Building class so that it responds to the following interaction pattern. Note that the `renter_with_highest_rent` method should ignore units with no renter.

```ruby
pry(main)> require './lib/building'
# => true

pry(main)> require './lib/renter'
# => true

pry(main)> require './lib/apartment'
# => true

pry(main)> building = Building.new
# => #<Building:0x00007fa83bb74928...>

pry(main)> a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})    
# => #<Apartment:0x00007fa83baae8b8...>

pry(main)> b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})    
# => #<Apartment:0x00007fa83bc777d0...>

pry(main)> spencer = Renter.new("Spencer")    
# => #<Renter:0x00007fa83bc37978...>

pry(main)> b2.add_renter(spencer)    

pry(main)> building.add_unit(a1)    

pry(main)> building.add_unit(b2)    

pry(main)> building.renter_with_highest_rent
# => #<Renter:0x00007fa83bc37978...>

pry(main)> jessie = Renter.new("Jessie")    
# => #<Renter:0x00007fa83b9b0358...>

pry(main)> a1.add_renter(jessie)    

pry(main)> building.renter_with_highest_rent
# => #<Renter:0x00007fa83b9b0358...>
```

## Iteration 4

Use TDD to update your Building class so that it responds to the following interaction pattern. Note that the `annual_breakdown` method should ignore units with no renter.

```ruby
pry(main)> require './lib/building'
# => true

pry(main)> require './lib/apartment'
# => true

pry(main)> require './lib/renter'
# => true

pry(main)> building = Building.new
# => #<Building:0x00007fb333c0cec8...>

pry(main)> a1 = Apartment.new({number: "A1", monthly_rent: 1200, bathrooms: 1, bedrooms: 1})    
# => #<Apartment:0x00007fb333bcd840...>

pry(main)> b2 = Apartment.new({number: "B2", monthly_rent: 999, bathrooms: 2, bedrooms: 2})    
# => #<Apartment:0x00007fb333a55008...>

pry(main)> spencer = Renter.new("Spencer")    
# => #<Renter:0x00007fb333d0d7f0...>

pry(main)> b2.add_renter(spencer)    

pry(main)> building.add_unit(a1)    

pry(main)> building.add_unit(b2)

pry(main)> building.annual_breakdown
# => {"Spencer" => 11988}

pry(main)> jessie = Renter.new("Jessie")    
# => #<Renter:0x00007fb333af5a80...>

pry(main)> a1.add_renter(jessie)    

pry(main)> building.annual_breakdown
# => {"Jessie" => 14400, "Spencer" => 11988}
```
