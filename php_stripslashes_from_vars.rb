ARGF.each do |line|
	tokens = line.split(' ')
	var = tokens[0].strip.sub(/'/, '').sub(/\$/, '')
#	print "var = #{var}\n"

	print "\t$#{var} = stripslashes($#{var});\n"
	
end
