def is_valid_walk(walk)
 
  n = 0
  s = 0
  e = 0
  w = 0
  
  walk.map { |x| x == "n" ?  n+=1 : x == "s" ? s+=1 : x == "e" ? e+=1 : x == "w" ? w+=1 : 0 }

   n - s == 0 && e - w == 0 && n+s+e+w == 10
end