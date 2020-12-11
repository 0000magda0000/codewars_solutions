def comp(a1, a2)
 a1.nil? || a2.nil? ? false : a1.map { |x| x*x }.sort == a2.sort
end