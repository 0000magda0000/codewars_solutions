def find_missing_letter(a)
  (a.minmax[0].upto(a.minmax[1]).to_a - a).join()
end

