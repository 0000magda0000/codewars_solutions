def generateHashtag(str)
  
  str.empty? ?
  false :
  str.gsub(/\s*/, "").split("").count < 1 ?
  false :
  str.gsub(/\s*/, "").insert(0, "#").split("").count  > 140 ?
  false :
  str.split("")[0] != "#" ? 
  str.split().collect(&:capitalize).join("").insert(0, "#").gsub(/\s*/, "") :
  str.split().collect(&:capitalize).join("").gsub(/\s*/, "")
end
 