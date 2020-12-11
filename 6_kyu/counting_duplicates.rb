def duplicate_count(t)
 a=t.downcase.split("")
  a.select { |u| a.count(u) > 1}.uniq.count
end


