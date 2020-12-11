def find_it(seq)
seq2 = seq.uniq.map {|x| [x, seq.count(x)]}.to_h
seq2.map { |n, o| o % 2 != 0 ? n : [] }.join().to_i
end