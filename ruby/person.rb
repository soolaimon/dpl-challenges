class Person
  require_relative 'helper'
  include Helper

  attr_accessor :attributes, :energy

  def initialize(attributes = {})
    @attributes = attributes
    @energy = 10
  end

  # This returns a string of the person's name
  def name
    @attributes[:name]
  end

  # Turns name string into array devided at spaces, returns first element in array.
  def first_name
    name.split(' ').first
  end
  # Same as last, but returns last element in array
  def last_name
    name.split(' ').last
  end
  # returns value associated with :age key in @attributes hash
  def age
    @attributes[:age]
  end

  # returns current year minus age
  def birthyear
    Time.now.year - age
  end

  # prints words argument. returns nil
  def say(words)
    puts words 
  end

  #  subtracts random amount of energy from person's energy level
  def run
    @energy -= rand(5)
  end

  # returns a string based on how much energy person has
  def energy_level
    case @energy
    when -100..-1
      "OMG ABOUT TO DIE!"
    when 0..3
      "tired"
    when 4..6
      "doing ok"
    when 6..10
      "ready to go"
    end
  end

  # sets @energy to passed in value. Not neccessery since already attr_accessor
  # def energy=(amount)
  #   @energy += amount
  # end

end