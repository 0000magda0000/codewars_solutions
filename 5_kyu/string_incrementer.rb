def increment_string(input)

  if only_integers?(input) 
    counter = input.chars.count
    incremented = (input.to_i + 1)
    incremented.to_s.rjust(counter, '0')
  elsif input.scan(/\b\d+(?=[a-zA-Z])/).nil?
    "#{input}1"
  elsif input.reverse.scan(/\b\d+(?=[a-zA-Z])/)[0].nil? 
    "#{input}1"
  else 
    string = input.reverse.scan(/(?<=\d)*[a-zA-Z]+\d*/).join.reverse
    counter = input.reverse.scan(/\b\d+(?=[a-zA-Z])/)[0].reverse.chars.count
    plus = input.reverse.scan(/\b\d+(?=[a-zA-Z])/)[0].reverse.to_i.next.to_s.rjust(counter, '0')
  "#{string}#{plus}"
  end
end

def only_integers?(string)
  string.scan(/\D/).empty?
end

def no_digit_end(string)
  
end
p increment_string("foobar002")
p increment_string("foobar092")
p increment_string("foobar001")
p increment_string("f00bar")
p increment_string("f00b4r")
p increment_string("1")
p increment_string("009")


