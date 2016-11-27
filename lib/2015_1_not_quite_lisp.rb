def floor_finder(input= "", floor = 0)

  input.chars.each do |char|
    if char == '('
      floor += 1
    elsif char == ')'
      floor -= 1
    end
  end

  floor
end

# p floor_finder( File.read("./lib/input.txt") )
# 74

def first_basement_char(input = "")
  floor = 0

  input.chars.each_with_index do |char, index|
    floor = floor_finder(char, floor)
    return index + 1 if floor == -1
  end
end

p first_basement_char( File.read("./lib/input.txt") )
