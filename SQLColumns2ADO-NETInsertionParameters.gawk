BEGIN {
	if (length(strSQLCmd) == 0)
	{
		print "Please specify the name of the sql command object:"
		print ""
		print "\tgawk -f SQLColumnsToADO-NETInsertionParameters.gawk -v strSQLCmd=sqlCommand1"
		exit
	}
}

{
	field = gensub(/[\]\[]/, "", "g", $1)
	position = match($0, /NOT NULL/)
	
	if (position > 0)
	{
		printf("\t\t\t\t\tthis.%s.Parameters[s_kstrParam%s].Value = row.%s;\n", strSQLCmd, field, field)
	}
	else
	{
		printf("\t\t\t\t\tif (false == row.Is%sNull())\n", field)
		printf("\t\t\t\t\t\tthis.%s.Parameters[s_kstrParam%s].Value = row.%s;\n", strSQLCmd, field, field)
		printf("\t\t\t\t\telse\n")
		printf("\t\t\t\t\t\tthis.%s.Parameters[s_kstrParam%s].Value = System.DBNull.Value;\n", strSQLCmd, field)
	}
}