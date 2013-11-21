include Enumerable
require "./lib"

input_file = "extras_short.css"
output_file = "output.css"

lines_array = IO.readlines input_file

organizer = Organizer.new
new_block = organizer.get_block(5, lines_array)

string_output = new_block.join("")

File.open(output_file, 'w+') {|f| f.write(string_output) }

puts "#{output_file} written"

#puts lines_array[0].split(" ")
