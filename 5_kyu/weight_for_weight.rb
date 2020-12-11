def order_weight(strng)
    strng.split(" ").map { |x| x.to_i.digits.inject(&:+) }
  .zip(strng.split(" "))
  .sort_by{|l|l[1]}
  .sort_by{|k|k[0]}
  .map { |j| j[1]}.join(" ")
end