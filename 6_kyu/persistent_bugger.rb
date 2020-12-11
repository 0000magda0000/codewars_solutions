def persistence(n)
  a=[]
   until n.digits.length == 1 do

    n = n.digits.inject(:*)
    a.push(n)
   
  end
  a.length
  
  

end
  
