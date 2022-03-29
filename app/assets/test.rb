input = [2, 4, 6, 4, 6, 8, 6, 9]

input.each_with_object(output={}) do |element, output|
  output[element] = input.count(element)
end

puts output


