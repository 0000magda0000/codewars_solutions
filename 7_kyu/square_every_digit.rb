def square_digits num
  num.to_s.split('').map(&:to_i).to_a.map{|x| x**2}.join.to_i
end