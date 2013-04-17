{
	var = gensub(/\$/, "", "g", $2)
	camel_var = gensub(/_([a-z])/, "\\u\\1", "g", var)
	print "camel_var = " camel_var
	#printf("\tfunction get
}