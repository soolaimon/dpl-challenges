def is_equal(a, b)
  a == b
end

def is_not_eqal(a, b)
  a != b
end

def tests_passed?(results)
  results.collect{|r| r if r==false}.compact.empty?
end

### DO NO EDIT BELOW THIS

subject = Person.new(name: 'Billy Test', age: 20)

results = []

results << is_equal(subject.first_name, 'Billy')
results << is_equal(subject.last_name, 'Test')
results << is_equal(subject.age, 20)
results << is_equal(subject.birthyear, 1994)
results << is_equal(subject.energy_level, "ready to go")
results << is_not_equal(subject.run, 10)

if tests_passed?(results)
  puts "test passed"
else
  puts "test failed"
end
