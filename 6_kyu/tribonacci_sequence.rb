def tribonacci(s,n)
  (n-3).times do
  s.push(s[s.length-3]+s[s.length-2]+s[s.length-1])
  end

n==2 ? s[0]+s[1].digits :
n==1 ? [s[0]] :
n==0 ? [] : s
    
end

