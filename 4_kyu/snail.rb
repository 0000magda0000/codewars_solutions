def snail(array)
  sn = []
  if array.count % 2 == 0
    length = (array.count / 2) - 1
  else
    length = (array.count / 2) - 1
  end

  if array == [[]]
    sn = []
  elsif array.count == 1
    sn << array
  elsif length == 0
    sn << array.first
    array.shift
    array = array.transpose
    sn << array.last
    array.pop
    array = array.transpose
    sn << array.last.reverse
    array.pop
    sn << array.reverse
  else
    length.times do
        # first row
        sn << array.first
        # deleting first row
        array.shift
        # last column
        sn << array.transpose.last
        # deleting last column
        array = array.transpose
        array.pop
        #  last row reverse
        array = array.transpose
        sn << array.last.reverse
        #  deleting last row
        array.pop
        #  first column
        array = array.transpose
        sn << array.first.reverse
        array.shift
        array = array.transpose
    end

  # last row
    sn << array.first
    array.shift
    array = array.transpose
    sn << array.last
    array.pop
    array = array.transpose
    sn << array.last.reverse
    array.pop
    sn << array.reverse
  end
  sn.flatten
end