{
#	strName = gensub(/,/, "", "g", $1)
	if (NF == 1)
	{
		strName = $1
	}
	else
	{
		strName = $2
	}

	count = split(strName, arFields, ".")
	strName = arFields[count]
	printf("\t\t\t\t\t\t\t\t\tnew System.Data.Common.DataColumnMapping(\"%s\", \"%s\"),\n", strName, strName)
}