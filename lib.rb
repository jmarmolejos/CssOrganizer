class Organizer
  def get_block(start_line, all_the_lines)
	  lines_array = all_the_lines

	  start_block_line = start_line
	  end_block_line = 0

	  lines_array.each_with_index { |line, i|
		  start_block_line = i if line.include? "{"
		  
		  if line.include? "}"
			  end_block_line = i
			  break
		  end
	  }
	  
	  if !line_contains_selector(lines_array[start_block_line])
	    start_block_line = get_start_block_line(lines_array, start_block_line)
	  end

	  lines_array.slice(start_block_line, (end_block_line - start_block_line) + 1)
  end
  
  def get_start_block_line(all_the_lines, where_you_at)
    while where_you_at > 0 do
      where_you_at = where_you_at - 1
      
      if line_contains_selector(all_the_lines[where_you_at])
        break
      end
      
    end
    
    where_you_at
  end
  
  def line_contains_selector(line)
    matches = line =~ /[#|.][0-9A-Za-z.#]|[A-Za-z]/
    !matches.nil? and !line.include? ":"
  end
  
end
