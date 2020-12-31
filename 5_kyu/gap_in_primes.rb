def prime?(num)
  (2..Math.sqrt(num).floor).each do |m|
    if num % m == 0
      return false
    end
  end
  true
end

def gap(g, m, n)

  if g.odd? && g > 1
    return nil
  end

  recent = 0
  current = 0

  (m..n).each do |num|
    if num.odd? && prime?(num)
      current = num
      if current - recent == g
        break
      else
        recent = current
      end
    end
  end

  [recent, current] unless current - recent != g

end