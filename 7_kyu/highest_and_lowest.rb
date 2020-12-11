def high_and_low(n)
 a = n.split(" ").map { |x| x.to_i }
 "#{a.max} #{a.min}"
end