require 'ffaker'

def image(filename)
  File.open(RAILS_ROOT + "/public/images/#{filename}", 'rb')
end


puts "creating courses and instructors"
10.times do
  @course = Course.create!({
    :title => Faker::Company.name,
    :caption => Faker::Lorem.paragraph,
    :course_type => Course::TYPES.sort_by {rand}.first
  })
  
  @instructor = Instructor.create!({
    :name => Faker::Name.name,
    :bio => Faker::Lorem.paragraphs,
    :image => image('instructor-ph.gif')
  })
  
end

puts "creating specials"
3.times do
  @special = Special.create!({
    :title => Faker::Company.name,
    :text => Faker::Lorem.paragraphs,
    :link => Faker::Internet.domain_name,
    :icon => image('icon-ph.gif')
  })
end

puts "creating ads"
4.times do
  @ad = Advertisement.create!({
    :image => image('main-place-holder.gif'),
    :link => Faker::Internet.domain_name
  })
end

puts "creating students"
20.times do
  @student = Student.create!({
    :main_image => image('kakui.jpg'),
    :name => Faker::Name.name,
    :age => (Date.today - 18.years),
    :birthplace => Faker::Company.name,
    :hometown => Faker::Company.name,
    :discipline => Faker::Company.name,
    :rank => Faker::Company.name,
    :bio => Faker::Lorem.paragraphs
  })
end

puts "done!"