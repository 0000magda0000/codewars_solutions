class Array
def swap! (a,b)
 self[a], self[b] = self[b], self[a]
self
end
end


def next_bigger(n)
print n

a = n.to_s.chars.map { |x| x.to_i }

  if a.sort.reverse == a 
      return -1
  elsif a.sort == a && a.uniq.count == a.count
      return a.swap!(-1, -2).join.to_i
  elsif a[-1] == a[-2] && a.count <= 3
      return a.swap!(-2, -3).join.to_i

  end

  
  i=1
  while i < a.count 
    if a[-i] > a[-i-1] 
       b = a[-i..-1].sort
       c = (b.find_index(b.detect { |x| x > a[-1-i] })-b.count)
        
        return a[0..-i-1].push(b).flatten.swap!(-i-1, c).join.to_i
    end
  i+=1  
  end
  
  
end