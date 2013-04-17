BEGIN {

	FS = "[ (),]"
	
	arTypes["int"] = "int"
	arTypes["float"] = "double"
	arTypes["varchar"] = "string"
	arTypes["datetime"] = "DateTime"
	
	arPrefices["int"] = "i"
	arPrefices["double"] = "d"
	arPrefices["string"] = "str"
	arPrefices["DateTime"] = "dt"
}

{
	strName = gensub(/@/, "", "g", $1)
	strType = arTypes[tolower($2)]
	printf("%s %s%s, ", strType, arPrefices[strType], strName)
}