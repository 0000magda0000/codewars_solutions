def pig_it text
  if text.scan(/\W/).empty?
    text.split.map { |word| word[1..-1] + word[0] + "ay" }.join(' ')
  else 
    text.split.map { |word| word[1..-1] + word[0] + "ay" }.join(' ').gsub(/(?<=\W)ay/, "")
  end
end