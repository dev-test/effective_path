#! /usr/bin/ruby

require 'effective_path'

effective_path = EffectivePath.new

puts "Please enter the string you would liked changed into the effective path:"

while true
   path =  gets
   puts " -> #{effective_path.path_for(path)}" 
   puts "Again?  to cancel use the system interrupt"
end
