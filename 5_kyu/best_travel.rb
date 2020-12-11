def choose_best_sum(t, k, ls)

i=0
array=[]
  
  while i < ls.count 
    (array << ls.combination(k).to_a.map(&:sum))
    i+=1
  end
 
  if (array.flatten.max == nil)
    nil
    elsif (array.flatten.max < t)
     array.flatten.max
    elsif array.flatten.find_index(t) != nil 
     t
    else array.flatten.sort.reverse.bsearch { |x| x<=t } 
  end

end









