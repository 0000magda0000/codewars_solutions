def solution(list)
  solution = []
  result = []
  one = []
  two = []
  many = []
  ranges = list.chunk_while { |x, y| y == x + 1 }.to_a
  ranges.each do |range|
    if range.size == 1
      solution << range.first
    elsif range.size == 2
      solution << [range.first, range.last]
    else
      solution << [range.first, range.last]
    end
  end
  solution.each do |sol|
    if sol.kind_of? Integer
      result << "#{sol}, "
    elsif sol.first + 1 == sol.last
      result << "#{sol.first}, #{sol.flatten.last}, "
    else
      result << "#{sol.first}-#{sol.last}, "
    end
  end
  result.join.gsub(/\s+/, "").delete_suffix(',')
end