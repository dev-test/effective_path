class EffectivePath 

  CURRENT_DIRECTORY_OPERATOR = '.'
  PARENT_DIRECTORY_OPERATOR = '..'
  DIRECTORY_SEPERATOR = '/'

  #You don't get method over loading in ruby
  def path_for(str)
    path_for_char_array(str.chars.to_a)
  end

  def path_for_char_array(chars)
    write_index = 0
    chars.each_with_index{|char, read_index|
      if char == CURRENT_DIRECTORY_OPERATOR && chars[read_index -1] == DIRECTORY_SEPERATOR 
        next
      end 
      if char == DIRECTORY_SEPERATOR && chars[write_index -1] == DIRECTORY_SEPERATOR
        next
      end
      chars[write_index] = char
      write_index += 1 

      if read_index == (chars.size()-1)
        (write_index..read_index).each{|blank|
          chars[blank] = nil
        }
      end

    }
    chars.to_s
  end

end
