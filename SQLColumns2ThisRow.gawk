{
	field = gensub(/[\]\[]/, "", "g", $1)
	position = match($0, /NOT NULL/)
	
	if (position > 0)
	{
		printf("\t\t\t\t\tthis.Row.%s = row.%s;\n", field, field)
	}
	else
	{
		printf("\t\t\t\t\tif (false == row.Is%sNull())\n", field)
		printf("\t\t\t\t\t\tthis.Row.%s = row.%s;\n", field, field)
		printf("\t\t\t\t\telse\n")
		printf("\t\t\t\t\t\tthis.Row.Set%sNull();\n", field)
	}
}