ARGF.each do |line|
	tokens = line.split(' ')
	var = tokens[0].strip.sub(/'/, '').sub(/\$/, '')
#	print "var = #{var}\n"

	print "\t$#{var} = isset($_POST['#{var}']) ? $_POST['#{var}'] : '';\n"
	
end
