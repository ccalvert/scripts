{
	print "\t\tprivate static readonly string s_kstrParam" gensub(/@/, "", "g", $1) " = \"" $1 "\";"
}