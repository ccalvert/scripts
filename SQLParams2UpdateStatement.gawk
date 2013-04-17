{
	field = gensub(/@/, "", "g", $1)
	if (NR == 1)
	{
		printf("\t  %s = %s\n", field, $1)
	}
	else
	{
		printf("\t, %s = %s\n", field, $1)
	}
}