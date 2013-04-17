BEGIN {

	FS = "[ (),]"
	
	arTypes["int"] = "int"
	arTypes["float"] = "float"
	arTypes["varchar"] = "string"
	arTypes["datetime"] = "DateTime"
	
	arPrefices["int"] = "i"
	arPrefices["float"] = "f"
	arPrefices["string"] = "str"
	arPrefices["DateTime"] = "dt"
}

{
	strName = gensub(/@/, "", "g", $1)
	strType = arTypes[tolower($2)]
	printf("\t\t\t\t\tthis.%s.Parameters[s_kstrParam%s].Value = %s%s;\n", strCmd, strName, arPrefices[strType], gensub(/Date/, "", "g", strName))
}