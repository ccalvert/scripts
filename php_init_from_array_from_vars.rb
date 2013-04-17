ARGF.each do |line|
    var = line.sub(/\$/, '').sub(/private/, '').sub(/;/, '').strip()
#	print "var = #{var}\n"
	print "\t\t$this->#{var} = $values['#{var}'];\n";
	
end
