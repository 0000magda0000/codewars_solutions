def panagram?(string)
  string.downcase.gsub(/[^a-z]/, '').chars.uniq.count >= 26 
end