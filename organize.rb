include Enumerable
require "./lib"

input_file = "extras.css"
output_file = "output.css"

lines_array = IO.readlines input_file

organizer = Organizer.new
new_block = organizer.get_all_blocks(lines_array, ".header")

string_output = new_block.join("")

File.open(output_file, 'w+') {|f| f.write(string_output) }

puts "#{output_file} written"

#puts lines_array[0].split(" ")
