{
	strBase = gensub(/@/, "", "g", $1)
	printf("\t\tprivate static readonly string s_kstrParam%s = \"%s\";\n", strBase, $1)
}