class Person
  include Helper
  attr_accessible :attributes, :energy

  def initalize(attributes = {})
    @attributes = attributes
    @energy = 10
  end

  # This returns a string of the person's name
  def name
    attributes(:name)
  end

  def first_name
    name.split(' ').first
  end

  def last_name
    name.split(' ').last
  end

  def age
    attributes[age]
  end

  def birthyear
     age - Time.now.to_i
  end

  def say(words)
    puts 'words'
  end

  def run
    @energy -= rand(5)
  end

  def energy_level
    case @energy
    when -100..-1
      "OMG ABOUT TO DIE!
    when 0..
      "tired'
    when 4..6
      "doing ok"
    when 6..10
      "ready to go"
    end
  end

  def energy_level=(amount)
    @energy += amount
  end

end