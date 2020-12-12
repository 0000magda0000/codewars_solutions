class Calculator


  def create_hash(string)
    operators = Hash.new
    numbers = Hash.new

    # remove all blank space
    array = string.split(" ").each { |s| s.to_i }
    # get operators with index
    array.each_with_index { |v, i| operators[i] = v  if v == "+" || v == "-" || v == "*" || v == "/" }
    # get numbers with index
    array.each_with_index { |v, i| numbers[i] = v.to_i if v != "+" || v != "-" || v != "*" || v != "/" }
    # merge numbers and operators, choose operator value if number value equals zero
    both = numbers.merge(operators){|key, number, operator| operator if number == 0}
    both
  end

  def higher_operators(both)
    counter = 0
    calculated = Hash.new
    # search for isolated * or / followed by a + or - operation
    both.each do |oi, bo|

      if (bo == "*" || bo == "/") && (both[oi + 2] == "+" || both[oi + 2] == "-" || both[oi + 2].nil?)
        # calculate isolated * or /, keep index of first value
        calculated[oi - 1] = both[oi - 1].send(bo, both[oi + 1].to_f)
        # delete hash index and value from both, that have index of first value plus 1 and 2
      elsif (bo == "*" || bo == "/") && ((both[oi + 2] == "*" || both[oi + 2] == "/")) && both[oi + 2] != nil && both[oi - 1] != nil
        calculated[oi - 1] = both[oi - 1].send(bo, both[oi + 1].to_f)
        break if counter == 0
      end
    end
    [both, calculated]
  end

  def update(both, calculated)
    # update merge with calculated index and value
    both = both.merge(calculated)

    both.each do |oi, bo|
      calculated.each do |ni, ca_|
        if ni == oi - 1
          both.delete(oi)
          both.delete(oi + 1)
        end
      end
    end
    # update index keys of both to be consecutive
    both.clone.each do |oi, bo|
      both.clone.each do |oi, bo|
        if both[oi + 1].nil?
          both[oi + 1] = both.delete(oi + 3)
        end
      end
    end
    # delete pairs if values is nil
    both.each do |oi, bo|
      both.delete(oi) if both[oi].nil?
    end
    both
  end

  def lower_operators(both)
    counter = 0
    calculated = Hash.new
    # search for isolated * or / followed by a + or - operation
    both.each do |oi, bo|
      if (bo == "+" || bo == "-")
        calculated[oi - 1] = both[oi - 1].send(bo, both[oi + 1].to_f)
      counter += 1
      end
      break if counter == 1
    end
    [both, calculated]
  end

  def evaluate(string)
    if string.split(" ").size == 1
      string.to_i
    elsif string.chars.size == 0
      ""
    else
    calculate(string)[0]
    end
  end


  def calculate(string)
    both = create_hash(string)
    both.each do |oi, bo|
      if bo == "*" || bo == "/"
        both_calculated = higher_operators(both)
        both = update(both_calculated[0], both_calculated[1])
      end
    end

    both.each do |oi, bo|
      if bo == "+" || bo == "-"
        both_calculated = lower_operators(both)
        both = update(both_calculated[0], both_calculated[1])
      end
    end
    both
  end
end