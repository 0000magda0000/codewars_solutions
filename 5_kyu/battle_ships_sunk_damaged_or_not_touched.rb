def damaged_or_sunk(board, attacks)
  attempts = []
  xs = []
  ys = []
  not_touched = 0
  dam = []
  hits = []
  sunk = 0
  damaged = 0
  total_hits_per_boat = 0

  # split coordinates in two arrays x and y and make them indexes
  attacks.each { |attack| ys << [(attack[1] - 1)] }
  attacks.each { |attack| xs << [(attack[0] - 1)] }

  # find the values (boats) of each attack save them in attempts array unless it hits water
  ys.flatten.zip(xs.flatten).each do |y, x|
    board.reverse.each_with_index do |b, i|
      if i == y
        attempts << board.reverse[y][x]
      end
    end
  end
  attempts.each { |a| dam << a if a != 0 }
  attempts.each { |a| not_touched << a if a == 0 }
  
  # find all damaged boats and the number of hits
  boats_damaged = attempts.each_with_object(Hash.new(0)) { |v, counts| counts[v] += 1 }
  # find all existing boats and their length
  boats_length = board.flatten.each_with_object(Hash.new(0))  { |v, counts| counts[v] += 1 }
  
  # add a virtual water boat 
  boats_damaged[0] = 0 if boats_damaged.keys != 0
  boats_length.each do |boat, length|
    boats_damaged.each do |b, hit|
      # find the sunk boats
      if boat == b && length == hit && boat != 0
        sunk += 1
      # find the damaged boats
      elsif boat == b && length > hit && boat != 0
        damaged += 1
      # find the boats that are not touched
      elsif boats_length.size > boats_damaged.size
        not_touched = boats_length.size - boats_damaged.size
      end
    end
  end

  boats_length.each do |boat, length|
    boats_damaged.each do |b, hit|
      total_hits_per_boat += 1 if boat == b
    end
  end

  scoring(sunk, damaged, not_touched)
end

def scoring(sunk, damaged, not_touched)
  points = sunk * 1 + damaged * 0.5 + not_touched * -1
  result = { "sunk" => sunk, "damaged" => damaged, "not_touched" => not_touched, "points" => points }
  return result
end